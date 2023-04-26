/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicUser extends _i1.SerializableEntity {
  PublicUser({
    required this.id,
    this.name,
    this.imageUrl,
    required this.verified,
    required this.private,
    required this.badges,
    this.friendship,
    this.friendRequest,
  });

  factory PublicUser.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicUser(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      verified:
          serializationManager.deserialize<bool>(jsonSerialization['verified']),
      private:
          serializationManager.deserialize<bool>(jsonSerialization['private']),
      badges: serializationManager
          .deserialize<List<_i2.UserBadge>>(jsonSerialization['badges']),
      friendship:
          serializationManager.deserialize<_i2.PublicUserFriendshipDetails?>(
              jsonSerialization['friendship']),
      friendRequest:
          serializationManager.deserialize<_i2.PublicUserFriendRequest?>(
              jsonSerialization['friendRequest']),
    );
  }

  int id;

  String? name;

  String? imageUrl;

  bool verified;

  bool private;

  List<_i2.UserBadge> badges;

  _i2.PublicUserFriendshipDetails? friendship;

  _i2.PublicUserFriendRequest? friendRequest;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'verified': verified,
      'private': private,
      'badges': badges,
      'friendship': friendship,
      'friendRequest': friendRequest,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'verified': verified,
      'private': private,
      'badges': badges,
      'friendship': friendship,
      'friendRequest': friendRequest,
    };
  }
}
