import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';
import 'package:scial_app_ui/src/widgets/base/sc_image.dart';

class SCAppBarImage extends StatelessWidget {

  const SCAppBarImage({
    super.key,
    this.file,
    this.url,
    this.icon,
    this.loading = false,
    this.error = false
  });

  const SCAppBarImage.file({
    super.key,
    this.file,
    this.icon,
    this.loading = false,
    this.error = false
  })
  : url = null;

  const SCAppBarImage.url({
    super.key,
    this.url,
    this.icon,
    this.loading = false,
    this.error = false
  })
  : file = null;

  final String? url;
  final SCIcons? icon;
  final bool loading;
  final bool error;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return SCImage(
      file: file,
      url: url,
      loading: loading,
      error: error,
      icon: icon,
      size: const Size(kToolbarHeight - 10.0, kToolbarHeight - 10.0),
      borderRadius: (kToolbarHeight - 10.0) / 2.0
    );
  }
}