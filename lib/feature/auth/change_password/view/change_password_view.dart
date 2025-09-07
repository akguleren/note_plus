import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:note_plus/app/extension/ref_extension.dart';
import 'package:note_plus/app/extension/widget_extension.dart';
import 'package:note_plus/feature/auth/change_password/viewmodel/change_password_view_model.dart';
import 'package:note_plus/feature/auth/login/viewmodel/login_view_model.dart';

@RoutePage()
class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ChangePasswordNotifier.vm);
    final vm = ref.watch(ChangePasswordNotifier.vm.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('ChangePassword.Title'),
          style: ref.textTheme.headline7.copyWith(color: ref.colorTokens.text?.primary),
        ),
        centerTitle: true,
      ),
      backgroundColor: ref.colorTokens.background?.primary,
      body: Padding(
        padding: ref.padding16,
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'email',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                keyboardType: TextInputType.emailAddress,
              ).toLabelWithHelperText(context, labelText: tr('Login.Email')),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => vm.sendPasswordResetLink(formKey),
                  child: ref
                      .watch(ChangePasswordNotifier.changePassword)
                      .maybeWhen(
                        loading: () => const CircularProgressIndicator(),
                        orElse: () => Text(tr('ChangePassword.Send_Reset_Link')),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
