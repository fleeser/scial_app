/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicNotificationDataFriendRequestAccepted
    extends _i1.SerializableEntity {
  PublicNotificationDataFriendRequestAccepted({
    required this.created,
    this.sender,
  });

  factory PublicNotificationDataFriendRequestAccepted.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicNotificationDataFriendRequestAccepted(
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      sender: serializationManager
          .deserialize<_i2.PublicNotificationDataFriendRequestAcceptedSender?>(
              jsonSerialization['sender']),
    );
  }

  DateTime created;

  _i2.PublicNotificationDataFriendRequestAcceptedSender? sender;

  @override
  Map<String, dynamic> toJson() {
    return {
      'created': created,
      'sender': sender,
    };
  }
}
