/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class Friendship extends _i1.TableRow {
  Friendship({
    int? id,
    required this.users,
    required this.created,
    required this.badges,
  }) : super(id);

  factory Friendship.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Friendship(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      users: serializationManager
          .deserialize<List<int>>(jsonSerialization['users']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      badges: serializationManager
          .deserialize<List<_i2.FriendshipBadge>>(jsonSerialization['badges']),
    );
  }

  static final t = FriendshipTable();

  List<int> users;

  DateTime created;

  List<_i2.FriendshipBadge> badges;

  @override
  String get tableName => 'friendships';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users': users,
      'created': created,
      'badges': badges,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'users': users,
      'created': created,
      'badges': badges,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'users': users,
      'created': created,
      'badges': badges,
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
      case 'users':
        users = value;
        return;
      case 'created':
        created = value;
        return;
      case 'badges':
        badges = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Friendship>> find(
    _i1.Session session, {
    FriendshipExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Friendship>(
      where: where != null ? where(Friendship.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Friendship?> findSingleRow(
    _i1.Session session, {
    FriendshipExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Friendship>(
      where: where != null ? where(Friendship.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Friendship?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Friendship>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required FriendshipExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Friendship>(
      where: where(Friendship.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Friendship row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Friendship row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Friendship row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    FriendshipExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Friendship>(
      where: where != null ? where(Friendship.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef FriendshipExpressionBuilder = _i1.Expression Function(FriendshipTable);

class FriendshipTable extends _i1.Table {
  FriendshipTable() : super(tableName: 'friendships');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final users = _i1.ColumnSerializable('users');

  final created = _i1.ColumnDateTime('created');

  final badges = _i1.ColumnSerializable('badges');

  @override
  List<_i1.Column> get columns => [
        id,
        users,
        created,
        badges,
      ];
}

@Deprecated('Use FriendshipTable.t instead.')
FriendshipTable tFriendship = FriendshipTable();
