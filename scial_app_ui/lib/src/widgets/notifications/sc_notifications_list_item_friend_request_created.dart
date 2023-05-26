import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCNotificationsListItemFriendRequestCreated extends StatelessWidget {

  const SCNotificationsListItemFriendRequestCreated({
    super.key,
    required this.read,
    required this.created,
    required this.data,
    required this.formatTime
  });

  final bool read;
  final DateTime created;
  final SCNotificationDataFriendRequestCreated data;
  final String Function(DateTime) formatTime;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 56.0 + 2.0 * SCGapSize.regular.getSpacing(theme),
      child: RawMaterialButton(
        onPressed: () {},
        padding: const SCEdgeInsets.symmetric(
          horizontal: SCGapSize.semiBig,
          vertical: SCGapSize.regular
        ).toEdgeInsets(theme),
        elevation: 0.0,
        child: Row(
          children: [
            SCImage.url(
              url: data.sender?.imageUrl,
              size: const Size(56.0, 56.0),
              borderRadius: 56.0 / 2.0,
              icon: SCIcons.user
            ),
            const SCGap.regular(),
            const Expanded(child: SCText.notificationText('lol')),
            const SCGap.regular(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SCText.notificationTime(formatTime(created)),
                if (!read) Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    color: theme.colors.accent,
                    shape: BoxShape.circle
                  )
                ),
                if (!read) const SizedBox(height: 10.0)
              ]
            )
          ]
        )
      )
    );
  }
}



/*import 'package:flutter/material.dart';

class NotificationsListItem extends StatelessWidget {

  const NotificationsListItem({
    super.key,
    required this.notification,
    required this.setRead,
    this.acceptRequest,
    this.denyRequest
  });

  final PublicNotification notification;
  final void Function(int) setRead;
  final Future<bool> Function()? acceptRequest;
  final Future<bool> Function()? denyRequest;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 56.0 + 2.0 * SCGapSize.regular.getSpacing(theme),
      child: RawMaterialButton(
        onPressed: () async => await _onPressed(context),
        padding: const SCEdgeInsets.symmetric(
          horizontal: SCGapSize.semiBig,
          vertical: SCGapSize.regular
        ).toEdgeInsets(theme),
        elevation: 0.0,
        child: Row(
          children: [
            SCImage.url(
              url: _imageUrl,
              size: const Size(56.0, 56.0),
              borderRadius: 56.0 / 2.0,
              icon: SCIcons.user
            ),
            const SCGap.regular(),
            Expanded(child: SCText.notificationText(_text(context))),
            const SCGap.regular(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SCText.notificationTime(notification.created.toTimeText(context)),
                if (!notification.read) Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    color: theme.colors.accent,
                    shape: BoxShape.circle
                  )
                ),
                if (!notification.read) const SizedBox(height: 10.0)
              ]
            )
          ]
        )
      )
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    setRead.call(notification.id);

    if (notification.data is PublicNotificationFriendRequestCreated) {
      await showFriendRequest(context, (notification.data as PublicNotificationFriendRequestCreated).friendRequest);
    } else if (notification.data is PublicNotificationFriendRequestAccepted) {
      int? uid = (notification.data as PublicNotificationFriendRequestAccepted).sender?.id;
      if (uid != null) context.navigateToUserPage(uid);
    } else if (notification.data is PublicNotificationFriendRequestDenied) {
      int? uid = (notification.data as PublicNotificationFriendRequestDenied).sender?.id;
      if (uid != null) context.navigateToUserPage(uid);
    }
  }

  Future<void> showFriendRequest(BuildContext context, PublicNotificationFriendRequestCreatedFriendRequest? friendRequest) async {

    SCThemeData theme = SCTheme.of(context);

    await showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      isDismissible: false,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
      backgroundColor: theme.colors.sheetBackground,
      builder: (BuildContext context) => NotificationsFriendRequestSheet(
        friendRequest: friendRequest,
        acceptRequest: acceptRequest!,
        denyRequest: denyRequest!,
      )
    );
  }

  String? get _imageUrl {
    return notification.data is PublicNotificationFriendRequestCreated
      ? (notification.data as PublicNotificationFriendRequestCreated).friendRequest?.sender?.imageUrl
      : notification.data is PublicNotificationFriendRequestAccepted
        ? (notification.data as PublicNotificationFriendRequestAccepted).sender?.imageUrl
        : (notification.data as PublicNotificationFriendRequestDenied).sender?.imageUrl;
  }

  String _text(BuildContext context) {
    return notification.data is PublicNotificationFriendRequestCreated
      ? AppLocalizations.of(context)!.notifications_notification_friend_request_created_text((notification.data as PublicNotificationFriendRequestCreated).friendRequest?.sender?.name ?? AppLocalizations.of(context)!.user_name)
      : notification.data is PublicNotificationFriendRequestAccepted
        ? AppLocalizations.of(context)!.notifications_notification_friend_request_accepted_text((notification.data as PublicNotificationFriendRequestAccepted).sender?.name ?? AppLocalizations.of(context)!.user_name)
        : AppLocalizations.of(context)!.notifications_notification_friend_request_denied_text((notification.data as PublicNotificationFriendRequestDenied).sender?.name ?? AppLocalizations.of(context)!.user_name);
  }
}*/