import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/widgets/auth_builder.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPage extends StatefulHookConsumerWidget {

  const SignUpPage({ super.key });

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {

    _emailController = useTextEditingController();
    _passwordController = useTextEditingController();

    final state = ref.watch(signUpControllerProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        backButton: SCAppBarBackButton(enabled: !state.isLoading),
        title: SCAppBarTitle(title: SCAppBarTitleText(text: AppLocalizations.of(context)!.sign_up_app_bar_title))
      ),
      body: AuthBuilder(
        title: AppLocalizations.of(context)!.sign_up_title,
        subtitle: AppLocalizations.of(context)!.sign_up_subtitle,
        children: [
          SCTextInputField.email(
            controller: _emailController, 
            hint: AppLocalizations.of(context)!.sign_up_email_hint_text,
            enabled: !state.isLoading
          ),
          const SCGap.semiBig(),
          SCTextInputField.password(
            controller: _passwordController, 
            hint: AppLocalizations.of(context)!.sign_up_password_hint_text,
            enabled: !state.isLoading
          ),
          const SCGap.semiBig(),
          SCButton.filled(
            onPressed: _signUp,
            title: AppLocalizations.of(context)!.sign_up_submit_button_title,
            isLoading: state.isLoading,
            isEnabled: !state.isLoading
          )
        ]
      )
    );
  }

  Future<void> _signUp() async {
    final controller = ref.read(signUpControllerProvider.notifier);
    final bool success = await controller.signUp(_emailController.text, _passwordController.text);

    if (success && context.mounted) {
      context.navigateToSignUpVerificationPage(_emailController.text);
    }
  }
}