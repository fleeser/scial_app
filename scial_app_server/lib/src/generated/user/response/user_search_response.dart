/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class UserSearchResponse extends _i1.SerializableEntity {
  UserSearchResponse({
    required this.success,
    this.code,
    this.users,
  });

  factory UserSearchResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserSearchResponse(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      code: serializationManager
          .deserialize<_i2.UserSearchResponseCode?>(jsonSerialization['code']),
      users: serializationManager.deserialize<List<_i2.PublicUserSearchUser>?>(
          jsonSerialization['users']),
    );
  }

  bool success;

  _i2.UserSearchResponseCode? code;

  List<_i2.PublicUserSearchUser>? users;

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'users': users,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'success': success,
      'code': code,
      'users': users,
    };
  }
}
