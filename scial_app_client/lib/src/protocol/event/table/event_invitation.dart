/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class EventInvitation extends _i1.SerializableEntity {
  EventInvitation({
    this.id,
    required this.user,
    required this.sender,
    required this.event,
    required this.created,
    this.text,
    required this.status,
  });

  factory EventInvitation.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventInvitation(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager
          .deserialize<_i2.EventInvitationStatus>(jsonSerialization['status']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int user;

  int sender;

  int event;

  DateTime created;

  String? text;

  _i2.EventInvitationStatus status;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'sender': sender,
      'event': event,
      'created': created,
      'text': text,
      'status': status,
    };
  }
}
