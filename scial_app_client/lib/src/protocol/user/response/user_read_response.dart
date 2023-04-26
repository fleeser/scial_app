/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class UserReadResponse extends _i1.SerializableEntity {
  UserReadResponse({
    required this.success,
    this.code,
    this.user,
  });

  factory UserReadResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserReadResponse(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      code: serializationManager
          .deserialize<_i2.UserReadResponseCode?>(jsonSerialization['code']),
      user: serializationManager
          .deserialize<_i2.PublicUser?>(jsonSerialization['user']),
    );
  }

  bool success;

  _i2.UserReadResponseCode? code;

  _i2.PublicUser? user;

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'user': user,
    };
  }
}
