part of 'change_password_view_model.dart';

class ChangePasswordNotifier {
  static final vm = _changePasswordViewModelProvider;
  static final changePassword = _changePasswordProvider;
}

@riverpod
class _ChangePassword extends _$ChangePassword {
  @override
  AsyncValue<bool?> build() => const AsyncValue.data(null);

  void doChangePassword(ChangePasswordModel payload) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(authRepositoryProvider).sendPasswordResetEmail(payload.email);
      SnackbarUtils.showSuccessSnackbar(tr('ChangePassword.Reset_Link_Sent'));
      state = const AsyncValue.data(true);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
