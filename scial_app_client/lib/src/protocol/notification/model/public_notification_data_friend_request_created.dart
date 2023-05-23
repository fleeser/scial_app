/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicNotificationDataFriendRequestCreated
    extends _i1.SerializableEntity {
  PublicNotificationDataFriendRequestCreated({
    required this.id,
    required this.created,
    this.sender,
    required this.status,
    this.text,
  });

  factory PublicNotificationDataFriendRequestCreated.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicNotificationDataFriendRequestCreated(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      sender: serializationManager
          .deserialize<_i2.PublicNotificationDataFriendRequestCreatedSender?>(
              jsonSerialization['sender']),
      status: serializationManager
          .deserialize<_i2.FriendRequestStatus>(jsonSerialization['status']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
    );
  }

  int id;

  DateTime created;

  _i2.PublicNotificationDataFriendRequestCreatedSender? sender;

  _i2.FriendRequestStatus status;

  String? text;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'sender': sender,
      'status': status,
      'text': text,
    };
  }
}
