import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSliverAppBarImage {

  const SCSliverAppBarImage({
    this.file,
    this.url,
    this.icon,
    this.loading = false,
    this.error = false
  });

  const SCSliverAppBarImage.file({
    this.file,
    this.icon,
    this.loading = false,
    this.error = false
  })
  : url = null;

  const SCSliverAppBarImage.url({
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
}

class SCSliverAppBarImageBackgroundWidget extends StatelessWidget {

  const SCSliverAppBarImageBackgroundWidget({
    super.key,
    required this.progress,
    this.file,
    this.url,
    this.icon,
    this.loading = false,
    this.error = false
  });

  final double progress;
  final String? url;
  final SCIcons? icon;
  final bool loading;
  final bool error;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1.0 - progress,
      child: SCImage(
        url: url,
        file: file,
        loading: loading,
        error: error,
        icon: icon,
        size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height / 2.0)
      )
    );
  }
}

class SCSliverAppBarImageWidget extends StatelessWidget {

  const SCSliverAppBarImageWidget({
    super.key,
    this.file,
    this.url,
    this.icon,
    this.loading = false,
    this.error = false
  });

  final String? url;
  final SCIcons? icon;
  final bool loading;
  final bool error;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return SCImage(
      url: url,
      file: file,
      loading: loading,
      error: error,
      icon: icon,
      size: const Size(kToolbarHeight - 10.0, kToolbarHeight - 10.0),
      borderRadius: (kToolbarHeight - 10.0) / 2.0
    );
  }
}