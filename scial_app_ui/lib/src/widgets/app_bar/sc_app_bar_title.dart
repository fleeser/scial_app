import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_shimmer.dart';
import 'package:scial_app_ui/src/widgets/text/sc_text.dart';

class SCAppBarTitle extends StatelessWidget {

  const SCAppBarTitle({
    super.key,
    this.title,
    this.loading = false,
    this.error = false
  });

  final String? title;
  final bool loading;
  final bool error;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SCShimmerLoading(
      isLoading: loading, 
      child: loading
        ? SCShimmerLoadingBox(
          size: Size(double.infinity, theme.typography.appBarTitle.fontSize!),
          borderRadius: theme.typography.appBarTitle.fontSize! / 2.0
        )
        : error || title == null
          ? const SizedBox.shrink()
          : SCText.appBarTitle(title!)
    );
  }
}