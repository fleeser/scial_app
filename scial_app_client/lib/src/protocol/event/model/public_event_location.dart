/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class PublicEventLocation extends _i1.SerializableEntity {
  PublicEventLocation({
    required this.lat,
    required this.long,
    this.name,
  });

  factory PublicEventLocation.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicEventLocation(
      lat: serializationManager.deserialize<double>(jsonSerialization['lat']),
      long: serializationManager.deserialize<double>(jsonSerialization['long']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
    );
  }

  double lat;

  double long;

  String? name;

  @override
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'long': long,
      'name': name,
    };
  }
}
