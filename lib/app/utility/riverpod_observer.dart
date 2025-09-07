import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/utility/print_log.dart';

class RiverpodObserver extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    printLog.i('Provider initialized: $provider\n value:$value');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    printLog.i('Provider disposed: $provider');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    printLog.i('Provider updated: $provider\n updated from:  $previousValue\n new: $newValue');
  }

  @override
  void providerDidFail(ProviderBase provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    printLog.e('Provider threw: $provider', error: error, stackTrace: stackTrace);
  }
}
