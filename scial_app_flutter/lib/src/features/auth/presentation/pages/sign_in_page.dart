import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/widgets/auth_builder.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatefulHookConsumerWidget {

  const SignInPage({ super.key });

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {

    _emailController = useTextEditingController();
    _passwordController = useTextEditingController();

    final state = ref.watch(signInControllerProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.sign_in_app_bar_title)
      ),
      body: AuthBuilder(
        title: AppLocalizations.of(context)!.sign_in_title,
        subtitle: AppLocalizations.of(context)!.sign_in_subtitle,
        children: [
          SCTextInputField.email(
            controller: _emailController, 
            hint: AppLocalizations.of(context)!.sign_in_email_hint_text,
            enabled: !state.isLoading
          ),
          const SCGap.semiBig(),
          SCTextInputField.password(
            controller: _passwordController,
            hint: AppLocalizations.of(context)!.sign_in_password_hint_text,
            enabled: !state.isLoading
          ),
          const SCGap.semiBig(),
          Align(
            alignment: Alignment.centerRight,
            child: SCLightButton(
              onPressed: _forgotPassword,
              isEnabled: !state.isLoading,
              title: AppLocalizations.of(context)!.sign_in_forgot_password_button_text,
              textAlign: TextAlign.right
            )
          ),
          const SCGap.semiBig(),
          SCButton.filled(
            onPressed: _signIn,
            title: AppLocalizations.of(context)!.sign_in_submit_button_title,
            isEnabled: !state.isLoading,
            isLoading: state.isLoading
          ),
          const SCGap.semiBig(),
          SCLightButton(
            title: AppLocalizations.of(context)!.sign_in_no_account_button_text,
            textAlign: TextAlign.center,
            onPressed: _signUp,
            isEnabled: !state.isLoading
          )
        ]
      )
    );
  }

  Future<void> _signIn() async {
    final controller = ref.read(signInControllerProvider.notifier);
    await controller.signIn(_emailController.text, _passwordController.text);
  }

  void _forgotPassword() {
    final controller = ref.read(signInControllerProvider.notifier);
    controller.forgotPassword(context);
  }

  void _signUp() {
    final controller = ref.read(signInControllerProvider.notifier);
    controller.signUp(context);
  }
}