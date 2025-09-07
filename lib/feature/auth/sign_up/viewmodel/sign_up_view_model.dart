import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:note_plus/app/utility/snackbar.dart';
import 'package:note_plus/feature/auth/login/model/auth_model.dart';
import 'package:note_plus/feature/auth/service/repository/auth_repository.dart';
import 'package:note_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_notifier.dart';
part 'sign_up_view_model.g.dart';

@riverpod
class _SignUpViewModel extends _$SignUpViewModel {
  @override
  _SignUpState build() => const _SignUpState();

  void changeObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void doSignUp(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;
      ref.read(SignUpNotifier.signUp.notifier).doSignUp(AuthModel.fromJson(formData));
    }
  }
}

class _SignUpState extends Equatable {
  const _SignUpState({this.isObscure = true, this.isConfirmationObscure = true});
  final bool isObscure;
  final bool isConfirmationObscure;

  @override
  List<Object?> get props => [isObscure, isConfirmationObscure];

  _SignUpState copyWith({bool? isObscure, bool? isConfirmationObscure}) {
    return _SignUpState(
      isObscure: isObscure ?? this.isObscure,
      isConfirmationObscure: isConfirmationObscure ?? this.isConfirmationObscure,
    );
  }
}
