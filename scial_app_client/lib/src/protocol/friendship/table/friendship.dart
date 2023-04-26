/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class Friendship extends _i1.SerializableEntity {
  Friendship({
    this.id,
    required this.users,
    required this.created,
    required this.badges,
  });

  factory Friendship.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Friendship(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      users: serializationManager
          .deserialize<List<int>>(jsonSerialization['users']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      badges: serializationManager
          .deserialize<List<_i2.FriendshipBadge>>(jsonSerialization['badges']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<int> users;

  DateTime created;

  List<_i2.FriendshipBadge> badges;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users': users,
      'created': created,
      'badges': badges,
    };
  }
}
