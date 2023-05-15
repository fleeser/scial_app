/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class EventGuestSuggestion extends _i1.SerializableEntity {
  EventGuestSuggestion({
    this.id,
    required this.sender,
    required this.user,
    required this.event,
    required this.created,
    this.text,
  });

  factory EventGuestSuggestion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventGuestSuggestion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int sender;

  int user;

  int event;

  DateTime created;

  String? text;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'user': user,
      'event': event,
      'created': created,
      'text': text,
    };
  }
}
