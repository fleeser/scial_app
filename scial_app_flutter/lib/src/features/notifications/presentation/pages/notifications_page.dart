import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/time_text_extensions.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/widgets/notifications_loading.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/widgets/notifications_text.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsPage extends StatefulHookConsumerWidget {

  const NotificationsPage({ super.key });

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {

    final notificationsController = ref.watch(notificationsControllerProvider);

    _tabController = useTabController(initialLength: _tabBarTitles.length);

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        appBar: SCAppBar(
          context: context,
          title: SCAppBarTitle(title: AppLocalizations.of(context)!.notifications_app_bar_title),
          actionButtons: _actionButtons
        ),
        body: Column(
          children: [
            SCTabBar(
              controller: _tabController,
              titles: _tabBarTitles
            ),
            Expanded(
              child: notificationsController.when(
                data: (List<PublicNotification> notifications) => notifications.isNotEmpty
                  ? SCNotificationsList(
                    notifications: notifications.map((notification) {

                      SCNotificationType type() {
                        switch (notification.type) {
                          case NotificationType.friendRequestCreated: return SCNotificationType.friendRequestCreated;
                          case NotificationType.friendRequestAccepted: return SCNotificationType.friendRequestAccepted;
                          case NotificationType.friendRequestDenied: return SCNotificationType.friendRequestDenied;
                          case NotificationType.eventGuestInvitationCreated: return SCNotificationType.eventGuestInvitationCreated;
                          case NotificationType.eventGuestInvitationAccepted: return SCNotificationType.eventGuestInvitationAccepted;
                          case NotificationType.eventGuestInvitationDenied: return SCNotificationType.eventGuestInvitationDenied;
                          case NotificationType.eventGuestRequestCreated: return SCNotificationType.eventGuestRequestCreated;
                          case NotificationType.eventGuestRequestAccepted: return SCNotificationType.eventGuestRequestAccepted;
                          case NotificationType.eventGuestRequestDenied: return SCNotificationType.eventGuestRequestDenied;
                          case NotificationType.eventGuestSuggestionCreated: return SCNotificationType.eventGuestSuggestionCreated;
                          case NotificationType.eventGuestSuggestionAccepted: return SCNotificationType.eventGuestSuggestionAccepted;
                          case NotificationType.eventGuestSuggestionDenied: return SCNotificationType.eventGuestSuggestionDenied;
                          case NotificationType.eventHostInvitationCreated: return SCNotificationType.eventHostInvitationCreated;
                          case NotificationType.eventHostInvitationAccepted: return SCNotificationType.eventHostInvitationAccepted;
                          case NotificationType.eventHostInvitationDenied: return SCNotificationType.eventHostInvitationDenied;
                          case NotificationType.eventHostRequestCreated: return SCNotificationType.eventHostRequestCreated;
                          case NotificationType.eventHostRequestAccepted: return SCNotificationType.eventHostRequestAccepted;
                          case NotificationType.eventHostRequestDenied: return SCNotificationType.eventHostRequestDenied;
                          case NotificationType.eventHostSuggestionCreated: return SCNotificationType.eventHostSuggestionCreated;
                          case NotificationType.eventHostSuggestionAccepted: return SCNotificationType.eventHostSuggestionAccepted;
                          case NotificationType.eventHostSuggestionDenied: return SCNotificationType.eventHostSuggestionDenied;
                        }
                      }

                      dynamic data() {
                        if (notification.data == null) return null;

                        switch (notification.type) {
                          case NotificationType.friendRequestCreated: return SCNotificationDataFriendRequestCreated(
                            created: (notification.data as PublicNotificationDataFriendRequestCreated).created,
                            status: (notification.data as PublicNotificationDataFriendRequestCreated).status == FriendRequestStatus.pending ? SCNotificationDataFriendRequestCreatedStatus.pending : (notification.data as PublicNotificationDataFriendRequestCreated).status == FriendRequestStatus.accepted ? SCNotificationDataFriendRequestCreatedStatus.accepted : SCNotificationDataFriendRequestCreatedStatus.denied,
                            sender: (notification.data as PublicNotificationDataFriendRequestCreated).sender != null 
                              ? SCNotificationDataFriendRequestCreatedSender(
                                name: (notification.data as PublicNotificationDataFriendRequestCreated).sender!.name,
                                imageUrl: (notification.data as PublicNotificationDataFriendRequestCreated).sender!.imageUrl,
                                verified: (notification.data as PublicNotificationDataFriendRequestCreated).sender!.verified
                              ) 
                              : null,
                            text: (notification.data as PublicNotificationDataFriendRequestCreated).text
                          );
                          case NotificationType.friendRequestAccepted: return SCNotificationDataFriendRequestAccepted(
                            created: (notification.data as PublicNotificationDataFriendRequestAccepted).created,
                            sender: (notification.data as PublicNotificationDataFriendRequestAccepted).sender != null 
                              ? SCNotificationDataFriendRequestAcceptedSender(
                                name: (notification.data as PublicNotificationDataFriendRequestAccepted).sender!.name,
                                imageUrl: (notification.data as PublicNotificationDataFriendRequestAccepted).sender!.imageUrl,
                                verified: (notification.data as PublicNotificationDataFriendRequestAccepted).sender!.verified
                              ) 
                              : null,
                            text: (notification.data as PublicNotificationDataFriendRequestAccepted).text
                          );
                          default: return SCNotificationDataFriendRequestDenied(
                            created: (notification.data as PublicNotificationDataFriendRequestDenied).created,
                            sender: (notification.data as PublicNotificationDataFriendRequestDenied).sender != null 
                              ? SCNotificationDataFriendRequestDeniedSender(
                                name: (notification.data as PublicNotificationDataFriendRequestDenied).sender!.name,
                                imageUrl: (notification.data as PublicNotificationDataFriendRequestDenied).sender!.imageUrl,
                                verified: (notification.data as PublicNotificationDataFriendRequestDenied).sender!.verified
                              ) 
                              : null,
                            text: (notification.data as PublicNotificationDataFriendRequestAccepted).text
                          );
                        }
                      }

                      return SCNotification(
                        type: type(),
                        read: notification.read,
                        created: notification.created,
                        data: data()
                      );
                    }).toList(),
                    formatTime: (DateTime time) => time.toDynamicDateText(context),
                    addBottomPadding: true
                  )
                  : NotificationsText(text: AppLocalizations.of(context)!.notifications_empty_notifications), 
                error: (Object e, StackTrace s) => const NotificationsText(text: 'Fehler nh'), // TODO
                loading: () => const NotificationsLoading()
              )
            )
          ]
        )
      )
    );
  }

  List<SCAppBarButton> get _actionButtons {
    return [
      SCAppBarButton(
        onPressed: _setAllRead,
        icon: SCIcons.check
      )
    ];
  }

  List<String> get _tabBarTitles => [
    AppLocalizations.of(context)!.notifications_tab_bar_all
  ];

  Future<void> _setAllRead() async {
    final controller = ref.read(notificationsControllerProvider.notifier);
    await controller.setAllRead();
  }

  Future<void> _setRead(int notificationId) async {
    final controller = ref.read(notificationsControllerProvider.notifier);
    await controller.setRead(notificationId);
  }

  Future<bool> _acceptRequest(int notificationId) async {
    final controller = ref.read(notificationsControllerProvider.notifier);
    return await controller.acceptRequest(notificationId);
  }

  Future<bool> _denyRequest(int notificationId) async {
    final controller = ref.read(notificationsControllerProvider.notifier);
    return await controller.denyRequest(notificationId);
  }
}