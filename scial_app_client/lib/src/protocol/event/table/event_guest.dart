/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class EventGuest extends _i1.SerializableEntity {
  EventGuest({
    this.id,
    required this.user,
    required this.event,
    required this.created,
  });

  factory EventGuest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventGuest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int user;

  int event;

  DateTime created;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'event': event,
      'created': created,
    };
  }
}
