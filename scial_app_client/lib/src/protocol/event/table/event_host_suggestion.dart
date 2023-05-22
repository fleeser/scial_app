/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class EventHostSuggestion extends _i1.SerializableEntity {
  EventHostSuggestion({
    this.id,
    required this.sender,
    required this.users,
    required this.event,
    required this.created,
    this.text,
    required this.status,
  });

  factory EventHostSuggestion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventHostSuggestion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      users: serializationManager
          .deserialize<List<int>>(jsonSerialization['users']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager.deserialize<_i2.EventHostSuggestionStatus>(
          jsonSerialization['status']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int sender;

  List<int> users;

  int event;

  DateTime created;

  String? text;

  _i2.EventHostSuggestionStatus status;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'users': users,
      'event': event,
      'created': created,
      'text': text,
      'status': status,
    };
  }
}
