/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class FriendRequest extends _i1.TableRow {
  FriendRequest({
    int? id,
    required this.sender,
    required this.receiver,
    this.text,
    required this.status,
    required this.created,
  }) : super(id);

  factory FriendRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FriendRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      receiver:
          serializationManager.deserialize<int>(jsonSerialization['receiver']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager
          .deserialize<_i2.FriendRequestStatus>(jsonSerialization['status']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
    );
  }

  static final t = FriendRequestTable();

  int sender;

  int receiver;

  String? text;

  _i2.FriendRequestStatus status;

  DateTime created;

  @override
  String get tableName => 'friend_requests';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'text': text,
      'status': status,
      'created': created,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'text': text,
      'status': status,
      'created': created,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'text': text,
      'status': status,
      'created': created,
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
      case 'sender':
        sender = value;
        return;
      case 'receiver':
        receiver = value;
        return;
      case 'text':
        text = value;
        return;
      case 'status':
        status = value;
        return;
      case 'created':
        created = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<FriendRequest>> find(
    _i1.Session session, {
    FriendRequestExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FriendRequest>(
      where: where != null ? where(FriendRequest.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<FriendRequest?> findSingleRow(
    _i1.Session session, {
    FriendRequestExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<FriendRequest>(
      where: where != null ? where(FriendRequest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<FriendRequest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<FriendRequest>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required FriendRequestExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FriendRequest>(
      where: where(FriendRequest.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    FriendRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    FriendRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    FriendRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    FriendRequestExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FriendRequest>(
      where: where != null ? where(FriendRequest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef FriendRequestExpressionBuilder = _i1.Expression Function(
    FriendRequestTable);

class FriendRequestTable extends _i1.Table {
  FriendRequestTable() : super(tableName: 'friend_requests');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final sender = _i1.ColumnInt('sender');

  final receiver = _i1.ColumnInt('receiver');

  final text = _i1.ColumnString('text');

  final status = _i1.ColumnEnum<_i2.FriendRequestStatus>('status');

  final created = _i1.ColumnDateTime('created');

  @override
  List<_i1.Column> get columns => [
        id,
        sender,
        receiver,
        text,
        status,
        created,
      ];
}

@Deprecated('Use FriendRequestTable.t instead.')
FriendRequestTable tFriendRequest = FriendRequestTable();
