/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicUserFriendship extends _i1.SerializableEntity {
  PublicUserFriendship({
    required this.id,
    required this.created,
    this.user,
    required this.badges,
  });

  factory PublicUserFriendship.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicUserFriendship(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      user: serializationManager.deserialize<_i2.PublicUserFriendshipUser?>(
          jsonSerialization['user']),
      badges: serializationManager
          .deserialize<List<_i2.FriendshipBadge>>(jsonSerialization['badges']),
    );
  }

  int id;

  DateTime created;

  _i2.PublicUserFriendshipUser? user;

  List<_i2.FriendshipBadge> badges;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'user': user,
      'badges': badges,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'created': created,
      'user': user,
      'badges': badges,
    };
  }
}
