import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO Merge this and the one sheet from profile since they do the same

class NotificationsFriendRequestSheet extends ConsumerStatefulWidget {

  const NotificationsFriendRequestSheet({
    super.key,
    this.friendRequest,
    required this.acceptRequest,
    required this.denyRequest
  });

  final PublicNotificationFriendRequestCreatedFriendRequest? friendRequest;
  final Future<bool> Function() acceptRequest;
  final Future<bool> Function() denyRequest;

  @override
  ConsumerState<NotificationsFriendRequestSheet> createState() => _NotificationsFriendRequestSheetState();
}

class _NotificationsFriendRequestSheetState extends ConsumerState<NotificationsFriendRequestSheet> {

  late AutoDisposeStateProvider<bool> acceptIsLoadingProvider;
  late AutoDisposeStateProvider<bool> denyIsLoadingProvider;

  @override
  void initState() {
    super.initState();

    acceptIsLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
    denyIsLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
  }

  @override
  Widget build(BuildContext context) {

    final bool acceptIsLoading = ref.watch(acceptIsLoadingProvider);
    final bool denyIsLoading = ref.watch(denyIsLoadingProvider);

    SCThemeData theme = SCTheme.of(context);

    return SCPadding(
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SCGap.semiBig(),
          Row(
            children: [
              Expanded(child: SCText.sheetTitle(AppLocalizations.of(context)!.notifications_friend_request_title)),
              const SCGap.semiBig(),
              SCSheetCloseButton(isEnabled: !acceptIsLoading && !denyIsLoading)
            ]
          ),
          const SCGap.semiBig(),
          if (widget.friendRequest == null) SCText.notificationsFriendRequestNotFound(AppLocalizations.of(context)!.notifications_friend_request_not_found),
          if (widget.friendRequest != null) SCImage.url(
            url: widget.friendRequest!.sender?.imageUrl,
            size: const Size(90.0, 90.0),
            borderRadius: 90.0 / 2.0,
            icon: SCIcons.user
          ),
          if (widget.friendRequest != null) const SCGap.semiBig(),
          if (widget.friendRequest != null) SCText.notificationsFriendRequestUserName(widget.friendRequest!.sender?.name ?? AppLocalizations.of(context)!.user_name),
          if (widget.friendRequest != null) const SCGap.semiBig(),
          if (widget.friendRequest != null) SCText.notificationsFriendRequestText(widget.friendRequest!.text ?? AppLocalizations.of(context)!.friend_request_text),
          if (widget.friendRequest != null) const SCGap.semiBig(),
          if (widget.friendRequest != null && widget.friendRequest!.status == FriendRequestStatus.pending) Row(
            children: [
              Expanded(
                child: SCButton.filled(
                  onPressed: acceptPressed,
                  isEnabled: !acceptIsLoading && !denyIsLoading,
                  isLoading: acceptIsLoading,
                  title: AppLocalizations.of(context)!.notifications_friend_request_accept_button_title
                )
              ),
              const SCGap.regular(),
              Expanded(
                child: SCButton.outlined(
                  onPressed: denyPressed,
                  isEnabled: !acceptIsLoading && !denyIsLoading,
                  isLoading: denyIsLoading,
                  title: AppLocalizations.of(context)!.notifications_friend_request_deny_button_title
                )
              )
            ]
          ),
          if (widget.friendRequest != null && widget.friendRequest!.status != FriendRequestStatus.pending) SCText.notificationsFriendRequestAlreadyAnswered(AppLocalizations.of(context)!.notifications_friend_request_already_answered(widget.friendRequest!.status == FriendRequestStatus.accepted ? AppLocalizations.of(context)!.notifications_friend_request_already_answered_accepted_text : AppLocalizations.of(context)!.notifications_friend_request_already_answered_denied_text)),
          SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
        ]
      )
    );
  }

  Future<void> acceptPressed() async {
    ref.read(acceptIsLoadingProvider.notifier).update((state) => state = true);

    bool success = await widget.acceptRequest.call();

    if (success && context.mounted) {
      Navigator.pop(context);
    } else {
      ref.read(acceptIsLoadingProvider.notifier).update((state) => state = false);
    }
  }

  Future<void> denyPressed() async {
    ref.read(denyIsLoadingProvider.notifier).update((state) => state = true);

    bool success = await widget.denyRequest.call();

    if (success && context.mounted) {
      Navigator.pop(context);
    } else {
      ref.read(denyIsLoadingProvider.notifier).update((state) => state = false);
    }
  }
}