import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectUsersList extends StatelessWidget {

  const SelectUsersList({
    super.key,
    required this.users,
    required this.selectedUserIds,
    this.addBottomPadding = false,
    this.onSelected
  });

  final List<PublicUserSearchUser> users;
  final List<int> selectedUserIds;
  final bool addBottomPadding;
  final void Function(int)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: addBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) {
        return SelectUsersListItem(
          user: users[index],
          isSelected: selectedUserIds.contains(users[index].id),
          onSelected: () {
            if (onSelected != null) {
              onSelected!(users[index].id);
            }
          }
        );
      }
    );
  }
}

class SelectUsersListItem extends StatelessWidget {

  const SelectUsersListItem({
    super.key,
    required this.user,
    required this.isSelected,
    this.onSelected
  });

  final PublicUserSearchUser user;
  final bool isSelected;
  final void Function()? onSelected;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 56.0 + 2.0 * SCGapSize.regular.getSpacing(theme),
      child: RawMaterialButton(
        onPressed: onSelected,
        elevation: 0.0,
        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig).toEdgeInsets(theme),
        child: Row(
          children: [
            SCImage.url(
              url: user.imageUrl,
              icon: SCIcons.user,
              size: const Size(56.0, 56.0),
              borderRadius: 56.0 / 2.0
            ),
            const SCGap.semiBig(),
            Expanded(
              child: Text(
                user.name ?? AppLocalizations.of(context)!.user_name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  package: 'scial_app_ui',
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 14.0
                )
              )
            ),
            const SCGap.semiBig(),
            Container(
              width: 26.0,
              height: 26.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: isSelected
                    ? Colors.green
                    : Colors.grey
                )
              ),
              child: isSelected
                ? Container(
                  width: 14.0,
                  height: 14.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green
                  )
                )
                : null
            )
          ]
        )
      )
    );
  }
}