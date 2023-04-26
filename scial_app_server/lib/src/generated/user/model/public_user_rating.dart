/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class PublicUserRating extends _i1.SerializableEntity {
  PublicUserRating({
    required this.id,
    required this.type,
    required this.created,
    this.sender,
    required this.stars,
    this.text,
  });

  factory PublicUserRating.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PublicUserRating(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      type: serializationManager
          .deserialize<_i2.RatingType>(jsonSerialization['type']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      sender: serializationManager
          .deserialize<_i2.PublicUserRatingUser?>(jsonSerialization['sender']),
      stars: serializationManager.deserialize<int>(jsonSerialization['stars']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
    );
  }

  int id;

  _i2.RatingType type;

  DateTime created;

  _i2.PublicUserRatingUser? sender;

  int stars;

  String? text;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'created': created,
      'sender': sender,
      'stars': stars,
      'text': text,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'type': type,
      'created': created,
      'sender': sender,
      'stars': stars,
      'text': text,
    };
  }
}
