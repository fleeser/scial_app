/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class NotificationReadResponse extends _i1.SerializableEntity {
  NotificationReadResponse({
    required this.success,
    this.code,
    this.notifications,
  });

  factory NotificationReadResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return NotificationReadResponse(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      code: serializationManager.deserialize<_i2.NotificationReadResponseCode?>(
          jsonSerialization['code']),
      notifications:
          serializationManager.deserialize<List<_i2.PublicNotification>?>(
              jsonSerialization['notifications']),
    );
  }

  bool success;

  _i2.NotificationReadResponseCode? code;

  List<_i2.PublicNotification>? notifications;

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'notifications': notifications,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'success': success,
      'code': code,
      'notifications': notifications,
    };
  }
}
