/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class Notification extends _i1.SerializableEntity {
  Notification({
    this.id,
    required this.created,
    required this.type,
    required this.read,
    required this.ref,
    required this.receiver,
  });

  factory Notification.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Notification(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      type: serializationManager
          .deserialize<_i2.NotificationType>(jsonSerialization['type']),
      read: serializationManager.deserialize<bool>(jsonSerialization['read']),
      ref: serializationManager.deserialize<int>(jsonSerialization['ref']),
      receiver:
          serializationManager.deserialize<int>(jsonSerialization['receiver']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime created;

  _i2.NotificationType type;

  bool read;

  int ref;

  int receiver;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'type': type,
      'read': read,
      'ref': ref,
      'receiver': receiver,
    };
  }
}
