import 'dart:async';
import 'package:dio/dio.dart';

/// Prevents multiple requests for the same service.
class RequestLatestInterceptor extends Interceptor {
  RequestLatestInterceptor({this.onErrorCallback});
  final _pendingRequests = <Uri, Completer<Response>>{};
  final Function(DioException)? onErrorCallback;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final uri = options.uri;

    if (_pendingRequests.containsKey(uri)) {
      _pendingRequests[uri]!.future.then((value) => handler.resolve(value)).catchError((error) {
        handler.reject(error);
      });
    } else {
      final completer = Completer<Response>();
      _pendingRequests[uri] = completer;

      handler.next(options);

      completer.future.then((response) {
        _pendingRequests.remove(uri);
        return response;
      }).catchError((Object error) {
        _pendingRequests.remove(uri);
        throw error;
      });
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final uri = response.requestOptions.uri;
    _pendingRequests[uri]?.complete(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final uri = err.requestOptions.uri;
    _pendingRequests[uri]?.completeError(err);

    // Trigger the callback if provided.
    if (onErrorCallback != null) {
      onErrorCallback!(err);
    }

    handler.next(err);
  }
}
