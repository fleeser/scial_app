/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicUserEvent extends _i1.SerializableEntity {
  PublicUserEvent({
    required this.id,
    required this.type,
    required this.visibility,
    required this.created,
    required this.title,
    required this.verified,
    required this.start,
    required this.end,
    this.imageUrl,
    required this.hosts,
    this.distance,
    this.location,
    required this.guestCount,
    required this.guestImages,
  });

  factory PublicUserEvent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicUserEvent(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
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
      start: serializationManager
          .deserialize<DateTime>(jsonSerialization['start']),
      end: serializationManager.deserialize<DateTime>(jsonSerialization['end']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      hosts: serializationManager.deserialize<List<_i2.PublicUserEventHost?>>(
          jsonSerialization['hosts']),
      distance: serializationManager
          .deserialize<double?>(jsonSerialization['distance']),
      location: serializationManager.deserialize<_i2.PublicUserEventLocation?>(
          jsonSerialization['location']),
      guestCount: serializationManager
          .deserialize<int>(jsonSerialization['guestCount']),
      guestImages: serializationManager
          .deserialize<List<String?>>(jsonSerialization['guestImages']),
    );
  }

  int id;

  _i2.EventType type;

  _i2.EventVisibility visibility;

  DateTime created;

  String title;

  bool verified;

  DateTime start;

  DateTime end;

  String? imageUrl;

  List<_i2.PublicUserEventHost?> hosts;

  double? distance;

  _i2.PublicUserEventLocation? location;

  int guestCount;

  List<String?> guestImages;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'visibility': visibility,
      'created': created,
      'title': title,
      'verified': verified,
      'start': start,
      'end': end,
      'imageUrl': imageUrl,
      'hosts': hosts,
      'distance': distance,
      'location': location,
      'guestCount': guestCount,
      'guestImages': guestImages,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'type': type,
      'visibility': visibility,
      'created': created,
      'title': title,
      'verified': verified,
      'start': start,
      'end': end,
      'imageUrl': imageUrl,
      'hosts': hosts,
      'distance': distance,
      'location': location,
      'guestCount': guestCount,
      'guestImages': guestImages,
    };
  }
}
