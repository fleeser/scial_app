import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/controller/forgot_password_submission_controller.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/widgets/auth_builder.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordSubmissionPage extends StatefulHookConsumerWidget {

  const ForgotPasswordSubmissionPage({ 
    super.key,
    this.email,
    this.verificationCode
  });

  final String? email;
  final String? verificationCode;

  @override
  ConsumerState<ForgotPasswordSubmissionPage> createState() => _ForgotPasswordSubmissionPageState();
}

class _ForgotPasswordSubmissionPageState extends ConsumerState<ForgotPasswordSubmissionPage> {

  late TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {

    _passwordController = useTextEditingController();

    final state = ref.watch(forgotPasswordSubmissionControllerProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        backButton: SCAppBarBackButton(enabled: !state.isLoading),
        title: SCAppBarTitle(title: SCAppBarTitleText(text: AppLocalizations.of(context)!.forgot_password_submission_app_bar_title))
      ),
      body: AuthBuilder(
        title: AppLocalizations.of(context)!.forgot_password_submission_title,
        subtitle: AppLocalizations.of(context)!.forgot_password_submission_subtitle,
        children: [
          SCTextInputField.password(
            controller: _passwordController,
            enabled: !state.isLoading,
            hint: AppLocalizations.of(context)!.forgot_password_submission_password_hint_text
          ),
          const AppGap.semiBig(),
          SCButton.filled(
            onPressed: _forgotPasswordSubmission,
            title: AppLocalizations.of(context)!.forgot_password_submission_submit_button_title,
            isLoading: state.isLoading,
            isEnabled: !state.isLoading
          )
        ]
      )
    );
  }

  Future<void> _forgotPasswordSubmission() async {
    final controller = ref.read(forgotPasswordSubmissionControllerProvider.notifier);
    final bool success = await controller.forgotPasswordSubmission(widget.email, widget.verificationCode, _passwordController.text);

    if (success && context.mounted && context.canPop()) {
      context.pop();
      context.pop();
      context.pop();
      context.pop();
    }
  }
}