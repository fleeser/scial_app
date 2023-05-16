import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/widgets/notifications_list.dart';
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
                  ? NotificationsList(
                    notifications: notifications,
                    setRead: (int notificationId) => _setRead(notificationId),
                    acceptRequest: _acceptRequest,
                    denyRequest: _denyRequest,
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