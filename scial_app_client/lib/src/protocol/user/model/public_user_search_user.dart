/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class PublicUserSearchUser extends _i1.SerializableEntity {
  PublicUserSearchUser({
    required this.id,
    this.name,
    this.imageUrl,
    required this.verified,
  });

  factory PublicUserSearchUser.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicUserSearchUser(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      verified:
          serializationManager.deserialize<bool>(jsonSerialization['verified']),
    );
  }

  int id;

  String? name;

  String? imageUrl;

  bool verified;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'verified': verified,
    };
  }
}
