/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class UserRatingsResponse extends _i1.SerializableEntity {
  UserRatingsResponse({
    required this.success,
    this.code,
    this.ratings,
  });

  factory UserRatingsResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserRatingsResponse(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      code: serializationManager
          .deserialize<_i2.UserRatingsResponseCode?>(jsonSerialization['code']),
      ratings: serializationManager.deserialize<List<_i2.PublicUserRating>?>(
          jsonSerialization['ratings']),
    );
  }

  bool success;

  _i2.UserRatingsResponseCode? code;

  List<_i2.PublicUserRating>? ratings;

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'ratings': ratings,
    };
  }
}
