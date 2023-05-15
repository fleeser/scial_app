/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class FriendRequestCreateResponse extends _i1.SerializableEntity {
  FriendRequestCreateResponse({
    required this.success,
    this.code,
  });

  factory FriendRequestCreateResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FriendRequestCreateResponse(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      code: serializationManager.deserialize<
          _i2.FriendRequestCreateResponseCode?>(jsonSerialization['code']),
    );
  }

  bool success;

  _i2.FriendRequestCreateResponseCode? code;

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
    };
  }
}
