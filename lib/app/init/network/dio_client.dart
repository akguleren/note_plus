// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/constant/hive_key.dart';
import '/app/core/network/interceptors/pretty_log_interceptors.dart';
import '/app/core/network/model/base_response_model.dart';
import '/app/core/network/model/i_network_model.dart';
import '/app/enums/env_enum.dart';
import '/app/init/network/exceptions/internal_exception.dart';
import '/app/utility/snackbar.dart';

Provider<DioClient> dioClientProvider = Provider<DioClient>((ref) => DioClient.instance);

class DioClient {
  static DioClient? _instance;
  late Dio _dio;

  // Private constructor
  DioClient._() {
    _dio = _initDio();
  }

  // Static instance getter
  static DioClient get instance {
    _instance ??= DioClient._();
    return _instance!;
  }

  Dio _initDio() {
    final dio = Dio()
      ..options.baseUrl = ((HiveKey.baseUrl.get ?? '') == '' ? EnvEnum.baseUrl.envValue! : HiveKey.baseUrl.get)!;
    if (HiveKey.token.get?.isNotEmpty == true) {
      dio.options.headers['Authorization'] = 'Bearer ${HiveKey.token.get}';
    }
    if (kDebugMode) dio.interceptors.add(PrettyLogInterceptors());
    return dio;
  }

  Future<void> updateToken(String token) async {
    await HiveKey.token.save(token);
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  BaseResponseModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw Exception('Connection timed out');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 400:
            throw Exception('Bad request');
          case 401:
            throw Exception('Unauthorized');
          case 403:
            throw Exception('Forbidden');
          case 404:
            throw Exception('Not found');
          case 500:
            throw Exception('Internal server error');
          default:
            throw Exception('Server error occurred');
        }
      case DioExceptionType.connectionError:
        throw Exception('No internet connection');
      default:
        throw Exception('Something went wrong');
    }
  }

  BaseResponseModel _handleInternalError(InternalException error) {
    SnackbarUtils.showErrorSnackbar(error.message);

    return BaseResponseModel(type: false, message: error.message);
  }

  Future<BaseResponseModel> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final data = BaseResponseModel.fromJson(response.data);
      if (data.type == true) {
        return data;
      }
      throw InternalException(data.message!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response?.statusCode == 401) {
        await HiveKey.baseUrl.delete;
        await HiveKey.token.delete;

        // appRouter.replaceAll([const LoginRoute()]);
        SnackbarUtils.clearSnackbars();
        return _handleInternalError(InternalException(e.response?.data['message']));
      } else if (e.response?.data['type'] == false) {
        return _handleInternalError(InternalException(e.response?.data['message']));
      } else {
        return _handleError(e);
      }
    } on InternalException catch (e) {
      return _handleInternalError(e);
    }
  }

  ///Post Method
  Future<BaseResponseModel> post(
    String path, {
    dynamic payload,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dynamic requestData;

      if (payload is FormData) {
        requestData = payload;
      } else if (payload is INetworkModel) {
        requestData = payload.toJson();
      } else if (payload is List<INetworkModel>) {
        requestData = payload.map((e) => e.toJson()).toList();
      } else {
        requestData = payload;
      }

      final Response response = await _dio.post(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final data = BaseResponseModel.fromJson(response.data);
      if (data.type == true) {
        return data;
      }
      throw InternalException(data.message!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response?.statusCode == 401) {
        await HiveKey.baseUrl.delete;
        await HiveKey.token.delete;

        // appRouter.replaceAll([const LoginRoute()]);
        SnackbarUtils.clearSnackbars();

        return _handleInternalError(InternalException(e.response?.data['message']));
      } else if (e.response?.data['type'] == false) {
        return _handleInternalError(InternalException(e.response?.data['message']));
      } else {
        return _handleError(e);
      }
    } on InternalException catch (e) {
      return _handleInternalError(e);
    }
  }

  ///Put Method
  Future<BaseResponseModel> put(
    String path, {
    dynamic payload,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dynamic requestData;

      if (payload is FormData) {
        requestData = payload;
      } else if (payload is INetworkModel) {
        requestData = payload.toJson();
      } else if (payload is List<INetworkModel>) {
        requestData = payload.map((e) => e.toJson()).toList();
      } else {
        requestData = payload;
      }

      final Response response = await _dio.put(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final data = BaseResponseModel.fromJson(response.data);
      if (data.type == true) {
        return data;
      }
      throw InternalException(data.message!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response?.statusCode == 401) {
        await HiveKey.baseUrl.delete;
        await HiveKey.token.delete;

        // appRouter.replaceAll([const LoginRoute()]);
        SnackbarUtils.clearSnackbars();

        return _handleInternalError(InternalException(e.response?.data['message']));
      } else if (e.response?.data['type'] == false) {
        return _handleInternalError(InternalException(e.response?.data['message']));
      } else {
        return _handleError(e);
      }
    } on InternalException catch (e) {
      return _handleInternalError(e);
    }
  }

  ///Delete Method
  Future<dynamic> delete(
    String path, {
    payload,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dynamic requestData;

      if (payload is FormData) {
        requestData = payload;
      } else if (payload is INetworkModel) {
        requestData = payload.toJson();
      } else if (payload is List<INetworkModel>) {
        requestData = payload.map((e) => e.toJson()).toList();
      } else {
        requestData = payload;
      }

      final Response response = await _dio.delete(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      final data = BaseResponseModel.fromJson(response.data);
      if (data.type == true) {
        return data;
      }
      throw InternalException(data.message!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response?.statusCode == 401) {
        await HiveKey.baseUrl.delete;
        await HiveKey.token.delete;

        // appRouter.replaceAll([const LoginRoute()]);
        SnackbarUtils.clearSnackbars();

        return _handleInternalError(InternalException(e.response?.data['message']));
      } else if (e.response?.data['type'] == false) {
        return _handleInternalError(InternalException(e.response?.data['message']));
      } else {
        return _handleError(e);
      }
    } on InternalException catch (e) {
      return _handleInternalError(e);
    }
  }
}
