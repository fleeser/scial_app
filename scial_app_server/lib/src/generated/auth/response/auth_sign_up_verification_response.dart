/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class AuthSignUpVerificationResponse extends _i1.SerializableEntity {
  AuthSignUpVerificationResponse({
    required this.success,
    this.code,
    this.keyId,
    this.key,
    this.userId,
    this.uniqueCode,
  });

  factory AuthSignUpVerificationResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AuthSignUpVerificationResponse(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      code: serializationManager.deserialize<
          _i2.AuthSignUpVerificationResponseCode?>(jsonSerialization['code']),
      keyId: serializationManager.deserialize<int?>(jsonSerialization['keyId']),
      key: serializationManager.deserialize<String?>(jsonSerialization['key']),
      userId:
          serializationManager.deserialize<int?>(jsonSerialization['userId']),
      uniqueCode: serializationManager
          .deserialize<String?>(jsonSerialization['uniqueCode']),
    );
  }

  bool success;

  _i2.AuthSignUpVerificationResponseCode? code;

  int? keyId;

  String? key;

  int? userId;

  String? uniqueCode;

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'keyId': keyId,
      'key': key,
      'userId': userId,
      'uniqueCode': uniqueCode,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'success': success,
      'code': code,
      'keyId': keyId,
      'key': key,
      'userId': userId,
      'uniqueCode': uniqueCode,
    };
  }
}
