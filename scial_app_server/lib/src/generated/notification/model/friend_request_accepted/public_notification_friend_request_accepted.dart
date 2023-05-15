/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../protocol.dart' as _i2;

class PublicNotificationFriendRequestAccepted extends _i1.SerializableEntity {
  PublicNotificationFriendRequestAccepted({this.sender});

  factory PublicNotificationFriendRequestAccepted.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicNotificationFriendRequestAccepted(
        sender: serializationManager
            .deserialize<_i2.PublicNotificationFriendRequestAcceptedSender?>(
                jsonSerialization['sender']));
  }

  _i2.PublicNotificationFriendRequestAcceptedSender? sender;

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender};
  }

  @override
  Map<String, dynamic> allToJson() {
    return {'sender': sender};
  }
}
