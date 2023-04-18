import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/controller/sign_up_verification_controller.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/widgets/auth_builder.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpVerificationPage extends StatefulHookConsumerWidget {

  const SignUpVerificationPage({ 
    super.key,
    this.email
  });

  final String? email;

  @override
  ConsumerState<SignUpVerificationPage> createState() => _SignUpVerificationPageState();
}

class _SignUpVerificationPageState extends ConsumerState<SignUpVerificationPage> {

  late TextEditingController _verificationCodeController;

  @override
  Widget build(BuildContext context) {

    _verificationCodeController = useTextEditingController();

    final state = ref.watch(signUpControllerProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        backButton: SCAppBarBackButton(enabled: !state.isLoading),
        title: SCAppBarTitle(title: SCAppBarTitleText(text: AppLocalizations.of(context)!.sign_up_verification_app_bar_title))
      ),
      body: AuthBuilder(
        title: AppLocalizations.of(context)!.sign_up_verification_title,
        subtitle: AppLocalizations.of(context)!.sign_up_verification_subtitle,
        children: [
          SCPinInput.verification(
            onCompleted: (String code) => _signUpVerification,
            enabled: !state.isLoading,
            controller: _verificationCodeController,
            error: state.hasError
          ),
          const SCGap.semiBig(),
          SCButton.filled(
            onPressed: _signUpVerification,
            title: AppLocalizations.of(context)!.sign_up_verification_submit_button_title,
            isLoading: state.isLoading,
            isEnabled: !state.isLoading
          )
        ]
      )
    );
  }

  Future<void> _signUpVerification() async {
    final controller = ref.read(signUpVerificationControllerProvider.notifier);
    await controller.signUpVerification(widget.email, _verificationCodeController.text);
  }
}