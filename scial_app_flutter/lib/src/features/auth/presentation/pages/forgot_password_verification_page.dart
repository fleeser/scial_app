import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/controller/forgot_password_verification_controller.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/widgets/auth_builder.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordVerificationPage extends StatefulHookConsumerWidget {

  const ForgotPasswordVerificationPage({ 
    super.key,
    this.email
  });

  final String? email;

  @override
  ConsumerState<ForgotPasswordVerificationPage> createState() => _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState extends ConsumerState<ForgotPasswordVerificationPage> {

  late TextEditingController _verificationCodeController;

  @override
  Widget build(BuildContext context) {

    _verificationCodeController = useTextEditingController();

    final state = ref.watch(forgotPasswordVerificationControllerProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        backButton: SCAppBarBackButton(enabled: !state.isLoading),
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.forgot_password_verification_app_bar_title)
      ),
      body: AuthBuilder(
        title: AppLocalizations.of(context)!.forgot_password_verification_title,
        subtitle: AppLocalizations.of(context)!.forgot_password_verification_subtitle,
        children: [
          SCPinInput.verification(
            enabled: !state.isLoading,
            controller: _verificationCodeController,
            error: state.hasError
          ),
          const SCGap.semiBig(),
          SCButton.filled(
            onPressed: _forgotPasswordVerification,
            title: AppLocalizations.of(context)!.forgot_password_verification_submit_button_title,
            isLoading: state.isLoading,
            isEnabled: !state.isLoading
          )
        ]
      )
    );
  }

  Future<void> _forgotPasswordVerification() async {
    final controller = ref.read(forgotPasswordVerificationControllerProvider.notifier);
    final bool success = await controller.forgotPasswordVerification(widget.email, _verificationCodeController.text);

    if (success && context.mounted) {
      context.navigateToForgotPasswordSubmissionPage(widget.email!, _verificationCodeController.text);
    }
  }
}

// TODO Instead of checing is pass email is empty maybe redirect to another screen before, if state.extra is empty or missing