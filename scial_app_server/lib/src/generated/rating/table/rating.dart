/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class Rating extends _i1.TableRow {
  Rating({
    int? id,
    required this.created,
    required this.type,
    required this.sender,
    required this.receiver,
    required this.stars,
    this.text,
  }) : super(id);

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

  static final t = RatingTable();

  DateTime created;

  _i2.RatingType type;

  int sender;

  int receiver;

  int stars;

  String? text;

  @override
  String get tableName => 'ratings';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'created':
        created = value;
        return;
      case 'type':
        type = value;
        return;
      case 'sender':
        sender = value;
        return;
      case 'receiver':
        receiver = value;
        return;
      case 'stars':
        stars = value;
        return;
      case 'text':
        text = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Rating>> find(
    _i1.Session session, {
    RatingExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Rating>(
      where: where != null ? where(Rating.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Rating?> findSingleRow(
    _i1.Session session, {
    RatingExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Rating>(
      where: where != null ? where(Rating.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Rating?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Rating>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required RatingExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Rating>(
      where: where(Rating.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Rating row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Rating row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Rating row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    RatingExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Rating>(
      where: where != null ? where(Rating.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef RatingExpressionBuilder = _i1.Expression Function(RatingTable);

class RatingTable extends _i1.Table {
  RatingTable() : super(tableName: 'ratings');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final created = _i1.ColumnDateTime('created');

  final type = _i1.ColumnEnum<_i2.RatingType>('type');

  final sender = _i1.ColumnInt('sender');

  final receiver = _i1.ColumnInt('receiver');

  final stars = _i1.ColumnInt('stars');

  final text = _i1.ColumnString('text');

  @override
  List<_i1.Column> get columns => [
        id,
        created,
        type,
        sender,
        receiver,
        stars,
        text,
      ];
}

@Deprecated('Use RatingTable.t instead.')
RatingTable tRating = RatingTable();
