/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicNotificationDataFriendRequestDenied extends _i1.SerializableEntity {
  PublicNotificationDataFriendRequestDenied({
    required this.created,
    this.sender,
  });

  factory PublicNotificationDataFriendRequestDenied.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicNotificationDataFriendRequestDenied(
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      sender: serializationManager
          .deserialize<_i2.PublicNotificationDataFriendRequestDeniedSender?>(
              jsonSerialization['sender']),
    );
  }

  DateTime created;

  _i2.PublicNotificationDataFriendRequestDeniedSender? sender;

  @override
  Map<String, dynamic> toJson() {
    return {
      'created': created,
      'sender': sender,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'created': created,
      'sender': sender,
    };
  }
}
