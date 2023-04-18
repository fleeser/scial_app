import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';
import 'package:scial_app_ui/src/widgets/base/sc_image.dart';

class SCAppBarTitleImage extends StatelessWidget {

  const SCAppBarTitleImage.url({
    super.key,
    this.url,
    this.icon,
    this.loading = false,
    this.error = false
  });

  final String? url;
  final SCIcons? icon;
  final bool loading;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return SCImage.url(
      url: url,
      loading: loading,
      error: error,
      icon: icon,
      size: const Size(kToolbarHeight - 10.0, kToolbarHeight - 10.0),
      borderRadius: (kToolbarHeight - 10.0) / 2.0
    );
  }
}