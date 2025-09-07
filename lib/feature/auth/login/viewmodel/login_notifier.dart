part of 'login_view_model.dart';

class LoginNotifier {
  static final vm = _loginViewModelProvider;
  static final login = _doLoginProvider;
  static final currentUser = _getLoggedInUserProvider;
  static final hasUser = _hasUserProvider;
}

@riverpod
Future<User?> _getLoggedInUser(Ref ref) async {
  return HiveKey.token.get != null ? FirebaseAuth.instance.currentUser : null;
}

@riverpod
bool _hasUser(Ref ref) {
  final user = ref.watch(_getLoggedInUserProvider).value;
  return user != null;
}

@riverpod
class _DoLogin extends _$DoLogin {
  @override
  AsyncValue<UserCredential?> build() => const AsyncValue.data(null);

  Future<UserCredential?> execute(AuthModel payload) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final userCredential = await repository.login(payload);
      // Handle successful login
      ref.invalidate(dioClientProvider);
      SnackbarUtils.showSuccessSnackbar(tr('Login.Login_Success'));
      await Future.delayed(const Duration(seconds: 1));
      SnackbarUtils.clearSnackbars();
      appRouter.replaceAll([const HomeRoute()]);
      state = AsyncValue.data(userCredential);
      return userCredential;
    } catch (e, stackTrace) {
      // Handle login errors
      state = AsyncValue.error(e, stackTrace);
      return null;
    }
  }
}
