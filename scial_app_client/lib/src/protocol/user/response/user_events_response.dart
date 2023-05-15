/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class UserEventsResponse extends _i1.SerializableEntity {
  UserEventsResponse({
    required this.success,
    this.code,
    this.events,
  });

  factory UserEventsResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserEventsResponse(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      code: serializationManager
          .deserialize<_i2.UserEventsResponseCode?>(jsonSerialization['code']),
      events: serializationManager
          .deserialize<List<_i2.PublicUserEvent>?>(jsonSerialization['events']),
    );
  }

  bool success;

  _i2.UserEventsResponseCode? code;

  List<_i2.PublicUserEvent>? events;

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'events': events,
    };
  }
}
