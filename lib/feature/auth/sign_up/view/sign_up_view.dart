import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:note_plus/app/extension/ref_extension.dart';
import 'package:note_plus/app/extension/widget_extension.dart';
import 'package:note_plus/feature/auth/sign_up/viewmodel/sign_up_view_model.dart';
import 'package:note_plus/main.dart';

@RoutePage()
class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(SignUpNotifier.vm);
    final vm = ref.watch(SignUpNotifier.vm.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('SignUp.Sign_Up'),
          style: ref.textTheme.headline7.copyWith(color: ref.colorTokens.text?.primary),
        ),
        centerTitle: true,
      ),
      backgroundColor: ref.colorTokens.background?.primary,
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: ref.padding16,
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
                const SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'password',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                  obscureText: state.isObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      splashRadius: 1,
                      icon: Icon(state.isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: vm.changeObscure,
                    ),
                  ),
                ).toLabelWithHelperText(context, labelText: tr('Login.Password')),
                const SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'confirm_password',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    (val) {
                      if (formKey.currentState?.fields['password']?.value != val) {
                        return tr('SignUp.Passwords_Do_Not_Match');
                      }
                      return null;
                    },
                  ]),
                  obscureText: state.isObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      splashRadius: 1,
                      icon: Icon(state.isConfirmationObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: vm.changeObscure,
                    ),
                  ),
                ).toLabelWithHelperText(context, labelText: tr('SignUp.Confirm_Password')),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => vm.doSignUp(formKey),
                    child: ref
                        .watch(SignUpNotifier.signUp)
                        .maybeWhen(
                          loading: () => const CircularProgressIndicator(),
                          orElse: () => Text(tr('SignUp.Sign_Up')),
                        ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(tr('SignUp.Already_Have_An_Account'), style: ref.textTheme.body2),
                    GestureDetector(
                      onTap: () {
                        appRouter.maybePop();
                      },
                      child: Text(
                        ' ${tr('Login.Login')}',
                        style: ref.textTheme.body2.copyWith(color: ref.commonColors.brand?.main),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
