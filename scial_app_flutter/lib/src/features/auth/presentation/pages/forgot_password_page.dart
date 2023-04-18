import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/widgets/auth_builder.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends StatefulHookConsumerWidget {

  const ForgotPasswordPage({ super.key });

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {

  late TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {

    _emailController = useTextEditingController();

    final state = ref.watch(forgotPasswordControllerProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        backButton: SCAppBarBackButton(enabled: !state.isLoading),
        title: SCAppBarTitle(title: SCAppBarTitleText(text: AppLocalizations.of(context)!.forgot_password_app_bar_title))
      ),
      body: AuthBuilder(
        title: AppLocalizations.of(context)!.forgot_password_title,
        subtitle: AppLocalizations.of(context)!.forgot_password_subtitle,
        children: [
          SCTextInputField.email(
            controller: _emailController,
            hint: AppLocalizations.of(context)!.forgot_password_email_hint_text,
            enabled: !state.isLoading
          ),
          const AppGap.semiBig(),
          SCButton.filled(
            onPressed: _forgotPassword,
            isLoading: state.isLoading,
            isEnabled: !state.isLoading,
            title: AppLocalizations.of(context)!.forgot_password_submit_button_title
          )
        ]
      )
    );
  }

  Future<void> _forgotPassword() async {
    final controller = ref.read(forgotPasswordControllerProvider.notifier);
    final bool success = await controller.forgotPassword(_emailController.text);

    if (success && context.mounted) {
      context.navigateToForgotPasswordVerificationPage(_emailController.text);
    }
  }
}