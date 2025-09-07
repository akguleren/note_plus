import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:note_plus/app/utility/snackbar.dart';
import 'package:note_plus/feature/auth/change_password/model/change_password_model.dart';
import 'package:note_plus/feature/auth/service/repository/auth_repository.dart';
import 'package:note_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_notifier.dart';
part 'change_password_view_model.g.dart';

@riverpod
class _ChangePasswordViewModel extends _$ChangePasswordViewModel {
  @override
  void build() {}

  void sendPasswordResetLink(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;
      ref.read(ChangePasswordNotifier.changePassword.notifier).doChangePassword(ChangePasswordModel.fromJson(formData));
      appRouter.pop();
    }
  }
}
