/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../protocol.dart' as _i2;

class Rating extends _i1.SerializableEntity {
  Rating({
    this.id,
    required this.created,
    required this.type,
    required this.sender,
    required this.receiver,
    required this.stars,
    this.text,
  });

  factory Rating.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Rating(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      type: serializationManager
          .deserialize<_i2.RatingType>(jsonSerialization['type']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      receiver:
          serializationManager.deserialize<int>(jsonSerialization['receiver']),
      stars: serializationManager.deserialize<int>(jsonSerialization['stars']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime created;

  _i2.RatingType type;

  int sender;

  int receiver;

  int stars;

  String? text;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'type': type,
      'sender': sender,
      'receiver': receiver,
      'stars': stars,
      'text': text,
    };
  }
}
