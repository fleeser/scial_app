import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCEditableUsers extends StatelessWidget {

  const SCEditableUsers({
    super.key,
    this.onEditPressed,
    required this.emptyText,
    this.imageUrls = const <String?>[]
  });

  final void Function()? onEditPressed;
  final String emptyText;
  final List<String?> imageUrls;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig).toEdgeInsets(theme),
      child: Row(
        children: [
          SizedBox(
            width: 46.0,
            height: 46.0,
            child: RawMaterialButton(
              onPressed: onEditPressed,
              elevation: 0.0,
              fillColor: theme.colors.editableUsersButtonBackground,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(46.0 / 2.0)),
              child: SCIcon(
                icon: SCIcons.edit2,
                color: theme.colors.editableUsersButtonIcon,
                size: 46.0 / 2.0
              )
            )
          ),
          const SCGap.regular(),
          imageUrls.isNotEmpty
            ? SCImageStack(
              count: imageUrls.length, 
              overlapPercentage: 0.7,
              urls: imageUrls,
              displayCount: imageUrls.length,
              icon: SCIcons.user, 
              size: const Size(56.0, 56.0)
            )
            : SCText.editableUsersText(emptyText)
        ]
      )
    );
  }
}