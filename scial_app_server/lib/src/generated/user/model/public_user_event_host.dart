/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class PublicUserEventHost extends _i1.SerializableEntity {
  PublicUserEventHost({
    required this.id,
    this.name,
    required this.verified,
    this.imageUrl,
  });

  factory PublicUserEventHost.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicUserEventHost(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      verified:
          serializationManager.deserialize<bool>(jsonSerialization['verified']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
    );
  }

  int id;

  String? name;

  bool verified;

  String? imageUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'verified': verified,
      'imageUrl': imageUrl,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'verified': verified,
      'imageUrl': imageUrl,
    };
  }
}
