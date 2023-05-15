/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../protocol.dart' as _i2;

class PublicNotificationFriendRequestCreatedFriendRequest
    extends _i1.SerializableEntity {
  PublicNotificationFriendRequestCreatedFriendRequest({
    required this.id,
    required this.created,
    this.text,
    required this.status,
    this.sender,
  });

  factory PublicNotificationFriendRequestCreatedFriendRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicNotificationFriendRequestCreatedFriendRequest(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager
          .deserialize<_i2.FriendRequestStatus>(jsonSerialization['status']),
      sender: serializationManager.deserialize<
              _i2.PublicNotificationFriendRequestCreatedFriendRequestSender?>(
          jsonSerialization['sender']),
    );
  }

  int id;

  DateTime created;

  String? text;

  _i2.FriendRequestStatus status;

  _i2.PublicNotificationFriendRequestCreatedFriendRequestSender? sender;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'text': text,
      'status': status,
      'sender': sender,
    };
  }
}
