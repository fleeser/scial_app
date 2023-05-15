import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/friendships/user_friendships_list_item.dart';

class UserFriendshipsList extends StatelessWidget {

  const UserFriendshipsList({
    super.key,
    required this.addBottomPadding,
    required this.friendships
  });

  final bool addBottomPadding;
  final List<PublicUserFriendship> friendships;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // TODO: Page key
      itemCount: friendships.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: addBottomPadding 
          ? MediaQuery.of(context).padding.bottom 
          : 0.0
        ),
      itemBuilder: (BuildContext context, int index) => UserFriendshipsListItem(friendship: friendships[index])
    );
  }
}