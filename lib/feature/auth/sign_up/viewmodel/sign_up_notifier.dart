part of 'sign_up_view_model.dart';

class SignUpNotifier {
  static final vm = _signUpViewModelProvider;
  static final signUp = _doSignUpProvider;
}

@riverpod
class _DoSignUp extends _$DoSignUp {
  @override
  AsyncValue<UserCredential?> build() => const AsyncValue.data(null);

  Future<void> doSignUp(AuthModel payload) async {
    state = const AsyncValue.loading();
    try {
      final response = await ref.read(authRepositoryProvider).signUp(payload);
      if (response != null) {
        SnackbarUtils.showSuccessSnackbar(tr('SignUp_Sign_Up_Success'));
        appRouter.pop(payload.email);
      }
      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
