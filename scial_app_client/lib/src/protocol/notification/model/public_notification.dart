/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicNotification extends _i1.SerializableEntity {
  PublicNotification({
    required this.id,
    required this.type,
    required this.created,
    required this.data,
  });

  factory PublicNotification.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicNotification(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      type: serializationManager
          .deserialize<_i2.NotificationType>(jsonSerialization['type']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      data:
          serializationManager.deserialize<dynamic>(jsonSerialization['data']),
    );
  }

  int id;

  _i2.NotificationType type;

  DateTime created;

  dynamic data;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'created': created,
      'data': data,
    };
  }
}
