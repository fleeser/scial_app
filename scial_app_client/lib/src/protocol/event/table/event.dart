/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class Event extends _i1.SerializableEntity {
  Event({
    this.id,
    required this.type,
    required this.visibility,
    required this.created,
    required this.title,
    required this.verified,
    required this.lat,
    required this.long,
    this.description,
    required this.start,
    required this.end,
    this.imageUrl,
  });

  factory Event.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Event(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      type: serializationManager
          .deserialize<_i2.EventType>(jsonSerialization['type']),
      visibility: serializationManager
          .deserialize<_i2.EventVisibility>(jsonSerialization['visibility']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      verified:
          serializationManager.deserialize<bool>(jsonSerialization['verified']),
      lat: serializationManager.deserialize<double>(jsonSerialization['lat']),
      long: serializationManager.deserialize<double>(jsonSerialization['long']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      start: serializationManager
          .deserialize<DateTime>(jsonSerialization['start']),
      end: serializationManager.deserialize<DateTime>(jsonSerialization['end']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.EventType type;

  _i2.EventVisibility visibility;

  DateTime created;

  String title;

  bool verified;

  double lat;

  double long;

  String? description;

  DateTime start;

  DateTime end;

  String? imageUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'visibility': visibility,
      'created': created,
      'title': title,
      'verified': verified,
      'lat': lat,
      'long': long,
      'description': description,
      'start': start,
      'end': end,
      'imageUrl': imageUrl,
    };
  }
}
