import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/app/constant/hive_key.dart';
import 'package:note_plus/app/init/navigation/navigation_route.dart';
import 'package:note_plus/app/init/network/dio_client.dart';
import 'package:note_plus/app/utility/snackbar.dart';
import 'package:note_plus/main.dart';
import 'package:note_plus/feature/auth/login/model/auth_model.dart';
import 'package:note_plus/feature/auth/service/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.dart';
part 'login_view_model.g.dart';

@riverpod
class _LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();

  void changeObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void navigateToRegister(GlobalKey<FormBuilderState> formKey) {
    appRouter.push(const SignUpRoute()).then((value) {
      if (value == null) return;
      formKey.currentState
        ?..save()
        ..patchValue({'email': value})
        ..save();
    });
  }

  void navigateToForgotPassword() {
    appRouter.push(const ChangePasswordRoute());
  }

  Future<void> doLogin(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;
      final payload = AuthModel.fromJson(formData);
      final response = await ref.read(LoginNotifier.login.notifier).execute(payload);
      if (response != null) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final idToken = await user.getIdToken();
          await ref.read(dioClientProvider).updateToken(idToken ?? '');
          ref.invalidate(dioClientProvider);
          appRouter.replaceAll([const HomeRoute()]);
        }
      }
    }
  }
}

class LoginState extends Equatable {
  const LoginState({this.isObscure = true});
  final bool isObscure;

  @override
  List<Object?> get props => [isObscure];

  LoginState copyWith({bool? isObscure}) {
    return LoginState(isObscure: isObscure ?? this.isObscure);
  }
}
