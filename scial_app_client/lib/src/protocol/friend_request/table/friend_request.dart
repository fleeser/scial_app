/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class FriendRequest extends _i1.SerializableEntity {
  FriendRequest({
    this.id,
    required this.sender,
    required this.receiver,
    this.text,
    required this.status,
    required this.created,
  });

  factory FriendRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FriendRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      receiver:
          serializationManager.deserialize<int>(jsonSerialization['receiver']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager
          .deserialize<_i2.FriendRequestStatus>(jsonSerialization['status']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int sender;

  int receiver;

  String? text;

  _i2.FriendRequestStatus status;

  DateTime created;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'text': text,
      'status': status,
      'created': created,
    };
  }
}
