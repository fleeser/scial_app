import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/base_location.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateEventSheetLocation extends StatelessWidget {

  const CreateEventSheetLocation({
    super.key,
    required this.location
  });

  final BaseLocation? location;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SCPadding(
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
      child: Row(
        children: [
          Expanded( // TODO: TextStyle in ui system?
            child: Text(
              location != null
                ? location!.name ?? '???'
                : AppLocalizations.of(context)!.create_event_sheet_location_no_location,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Poppins',
                package: 'scial_app_ui',
                fontWeight: FontWeight.w400,
                color: Colors.green, // TODO
                fontSize: 14.0
              )
            )
          ),
          const SCGap.regular(),
          SizedBox(
            width: 46.0,
            height: 46.0,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 0.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(46.0 / 2.0)),
              fillColor: theme.colors.editableUsersButtonBackground,
              child: SCIcon(
                icon: SCIcons.edit2,
                color: theme.colors.editableUsersButtonIcon,
                size: 46.0 / 2.0
              )
            )
          )
        ]
      )
    );
  }
}