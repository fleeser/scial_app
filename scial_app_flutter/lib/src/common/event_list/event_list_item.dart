import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/time_text_extensions.dart';
import 'package:scial_app_flutter/src/extensions/distance_extension.dart';
import 'package:scial_app_flutter/src/extensions/event_type_extension.dart';
import 'package:scial_app_flutter/src/extensions/event_visibility_extension.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListItem extends StatelessWidget {

  const EventListItem({
    super.key,
    required this.event
  });

  final PublicEvent event;

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);
    
    return RawMaterialButton(
        onPressed: () => context.navigateToEventPage(event.id),
        padding: const SCEdgeInsets.symmetric(
          horizontal: SCGapSize.semiBig,
          vertical: SCGapSize.regular
        ).toEdgeInsets(theme),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 56.0 + 0.5 * 32.0,
                  height: 56.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SCImage.url(
                          url: event.imageUrl,
                          size: const Size(56.0, 56.0),
                          icon: SCIcons.image,
                          borderRadius: 56.0 / 2.0
                        )
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SCImage.url(
                          url: event.hosts.isNotEmpty
                            ? event.hosts.first?.imageUrl
                            : null,
                          size: const Size(32.0, 32.0),
                          borderRadius: 32.0 / 2.0,
                          icon: SCIcons.user
                        )
                      )
                    ]
                  )
                ),
                const SCGap.regular(),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: SCText.eventListTitle(event.title)),
                          const SCGap.semiBig(),
                          SCText.eventListDistance(event.distance != null ? event.distance!.toText(context) : '???')
                        ]
                      ),
                      Row(
                        children: [
                          SCIcon(
                            icon: SCIcons.mapPin, 
                            size: 12.0, 
                            color: theme.colors.eventListIcon
                          ),
                          const SCGap.small(),
                          Expanded(child: SCText.eventListLocation(event.location == null ? '???' : event.location?.name ?? AppLocalizations.of(context)!.no_address))
                        ]
                      ),
                      Row(
                        children: [
                          SCIcon(
                            icon: SCIcons.clock, 
                            size: 12.0, 
                            color: theme.colors.eventListIcon
                          ),
                          const SCGap.small(),
                          Expanded(child: SCText.eventListTime(event.start.toDynamicFullDateTimeText(context)))
                        ]
                      )
                    ]
                  )
                )
              ]
            ),
            const SCGap.regular(),
            Row(
              children: [
                Flexible(
                  child: event.guestCount > 0
                    ? SCImageStack(
                      count: event.guestCount, 
                      icon: SCIcons.user, 
                      size: const Size(32.0, 32.0),
                      urls: event.guestImages
                    )
                    : FittedBox(
                      child: Container(
                        height: 32.0,
                        alignment: Alignment.center,
                        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.regular).toEdgeInsets(theme),
                        decoration: BoxDecoration(
                          color: theme.colors.eventNoGuestsBackground,
                          borderRadius: BorderRadius.circular(32.0 / 2.0)
                        ),
                        child: SCText.eventNoGuests(AppLocalizations.of(context)!.no_guests)
                      )
                    )
                ),
                const Spacer(),
                const Spacer(),
                const SCGap.semiBig(),
                Text(
                  event.visibility.emoji,
                  style: const TextStyle(fontSize: 22.0),
                ),
                const SCGap.semiSmall(),
                Text(
                  event.type.emoji,
                  style: const TextStyle(fontSize: 22.0),
                )
              ]
            )
          ]
        )
      
    );
  }
}