/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicEvent extends _i1.SerializableEntity {
  PublicEvent({
    required this.id,
    required this.created,
    required this.type,
    required this.visibility,
    required this.title,
    this.imageUrl,
    required this.verified,
    required this.start,
    required this.end,
    required this.hosts,
    this.distance,
    this.location,
    required this.guestCount,
    required this.guestImages,
  });

  factory PublicEvent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicEvent(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      type: serializationManager
          .deserialize<_i2.EventType>(jsonSerialization['type']),
      visibility: serializationManager
          .deserialize<_i2.EventVisibility>(jsonSerialization['visibility']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      verified:
          serializationManager.deserialize<bool>(jsonSerialization['verified']),
      start: serializationManager
          .deserialize<DateTime>(jsonSerialization['start']),
      end: serializationManager.deserialize<DateTime>(jsonSerialization['end']),
      hosts: serializationManager
          .deserialize<List<_i2.PublicEventHost?>>(jsonSerialization['hosts']),
      distance: serializationManager
          .deserialize<double?>(jsonSerialization['distance']),
      location: serializationManager
          .deserialize<_i2.PublicEventLocation?>(jsonSerialization['location']),
      guestCount: serializationManager
          .deserialize<int>(jsonSerialization['guestCount']),
      guestImages: serializationManager
          .deserialize<List<String?>>(jsonSerialization['guestImages']),
    );
  }

  int id;

  DateTime created;

  _i2.EventType type;

  _i2.EventVisibility visibility;

  String title;

  String? imageUrl;

  bool verified;

  DateTime start;

  DateTime end;

  List<_i2.PublicEventHost?> hosts;

  double? distance;

  _i2.PublicEventLocation? location;

  int guestCount;

  List<String?> guestImages;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'type': type,
      'visibility': visibility,
      'title': title,
      'imageUrl': imageUrl,
      'verified': verified,
      'start': start,
      'end': end,
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
      'created': created,
      'type': type,
      'visibility': visibility,
      'title': title,
      'imageUrl': imageUrl,
      'verified': verified,
      'start': start,
      'end': end,
      'hosts': hosts,
      'distance': distance,
      'location': location,
      'guestCount': guestCount,
      'guestImages': guestImages,
    };
  }
}
