import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_shimmer.dart';
import 'package:scial_app_ui/src/widgets/text/sc_text.dart';

class SCAppBarTitleText extends StatelessWidget {

  const SCAppBarTitleText({
    super.key,
    this.text,
    this.loading = false,
    this.error = false
  });

  final String? text;
  final bool loading;
  final bool error;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SCShimmerLoading(
      isLoading: loading, 
      loadingChild: SCShimmerLoadingBox(
        size: Size(double.infinity, theme.typography.appBarTitleCollapsed.fontSize!),
        borderRadius: theme.typography.appBarTitleCollapsed.fontSize! / 2.0
      ),
      child: error || text == null
        ? const SizedBox.shrink()
        : SCText.appBarTitle(text!)
    );
  }
}