/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicEventFullGuest extends _i1.SerializableEntity {
  PublicEventFullGuest({
    this.user,
    required this.joined,
  });

  factory PublicEventFullGuest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicEventFullGuest(
      user: serializationManager.deserialize<_i2.PublicEventFullGuestUser?>(
          jsonSerialization['user']),
      joined: serializationManager
          .deserialize<DateTime>(jsonSerialization['joined']),
    );
  }

  _i2.PublicEventFullGuestUser? user;

  DateTime joined;

  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'joined': joined,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'user': user,
      'joined': joined,
    };
  }
}
