import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_sliver_app_bar_button.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';

class SCSliverAppBarBackButton extends StatelessWidget {

  const SCSliverAppBarBackButton({
    super.key,
    this.enabled = true,
    this.loading = false
  });

  final bool loading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SCSliverAppBarButton(
      onPressed: () => onPressed(context),
      loading: loading,
      enabled: enabled,
      icon: SCIcons.arrowLeft
    );
  }

  void onPressed(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}