import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:note_plus/app/extension/ref_extension.dart';
import 'package:note_plus/app/extension/widget_extension.dart';
import 'package:note_plus/app/init/navigation/navigation_route.dart';
import 'package:note_plus/feature/auth/login/viewmodel/login_view_model.dart';
import 'package:note_plus/main.dart';

@RoutePage()
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(LoginNotifier.vm);
    final vm = ref.watch(LoginNotifier.vm.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('Login.Login'), style: ref.textTheme.headline7.copyWith(color: ref.colorTokens.text?.primary)),
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
              const Spacer(flex: 1),
              Text("Note Plus", style: ref.textTheme.headline4, textAlign: TextAlign.center),
              const Spacer(flex: 2),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(hintText: tr('Login.Email_Hint')),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                keyboardType: TextInputType.emailAddress,
              ).toLabelWithHelperText(context, labelText: tr('Login.Email')),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'password',
                validator: FormBuilderValidators.required(),
                obscureText: state.isObscure,
                decoration: InputDecoration(
                  hintText: tr('Login.Password_Hint'),
                  suffixIcon: IconButton(
                    splashRadius: 1,
                    icon: Icon(state.isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: vm.changeObscure,
                  ),
                ),
              ).toLabelWithHelperText(context, labelText: tr('Login.Password')),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => vm.navigateToForgotPassword(),
                  child: Text(
                    tr('Login.Forgot_Password'),
                    style: ref.textTheme.body5.copyWith(color: ref.colorTokens.text?.primary),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => vm.doLogin(formKey),
                  child: ref
                      .watch(LoginNotifier.login)
                      .maybeWhen(
                        loading: () => const CircularProgressIndicator(),
                        orElse: () => Text(tr('Login.Login')),
                      ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(tr('Login.Dont_Have_An_Account'), style: ref.textTheme.body2),
                  GestureDetector(
                    onTap: () => vm.navigateToRegister(formKey),
                    child: Text(
                      ' ${tr('Login.Register')}',
                      style: ref.textTheme.body2.copyWith(color: ref.commonColors.brand?.main),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
