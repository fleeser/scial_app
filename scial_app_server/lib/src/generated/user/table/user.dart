/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class User extends _i1.TableRow {
  User({
    int? id,
    this.name,
    required this.created,
    this.imageUrl,
    required this.verified,
    required this.private,
    required this.badges,
    required this.uniqueCode,
  }) : super(id);

  factory User.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return User(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      verified:
          serializationManager.deserialize<bool>(jsonSerialization['verified']),
      private:
          serializationManager.deserialize<bool>(jsonSerialization['private']),
      badges: serializationManager
          .deserialize<List<_i2.UserBadge>>(jsonSerialization['badges']),
      uniqueCode: serializationManager
          .deserialize<String>(jsonSerialization['uniqueCode']),
    );
  }

  static final t = UserTable();

  String? name;

  DateTime created;

  String? imageUrl;

  bool verified;

  bool private;

  List<_i2.UserBadge> badges;

  String uniqueCode;

  @override
  String get tableName => 'users';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created': created,
      'imageUrl': imageUrl,
      'verified': verified,
      'private': private,
      'badges': badges,
      'uniqueCode': uniqueCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'created': created,
      'imageUrl': imageUrl,
      'verified': verified,
      'private': private,
      'badges': badges,
      'uniqueCode': uniqueCode,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'created': created,
      'imageUrl': imageUrl,
      'verified': verified,
      'private': private,
      'badges': badges,
      'uniqueCode': uniqueCode,
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
      case 'name':
        name = value;
        return;
      case 'created':
        created = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      case 'verified':
        verified = value;
        return;
      case 'private':
        private = value;
        return;
      case 'badges':
        badges = value;
        return;
      case 'uniqueCode':
        uniqueCode = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<User>> find(
    _i1.Session session, {
    UserExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<User?> findSingleRow(
    _i1.Session session, {
    UserExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<User>(
      where: where != null ? where(User.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<User?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<User>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required UserExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    UserExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef UserExpressionBuilder = _i1.Expression Function(UserTable);

class UserTable extends _i1.Table {
  UserTable() : super(tableName: 'users');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final created = _i1.ColumnDateTime('created');

  final imageUrl = _i1.ColumnString('imageUrl');

  final verified = _i1.ColumnBool('verified');

  final private = _i1.ColumnBool('private');

  final badges = _i1.ColumnSerializable('badges');

  final uniqueCode = _i1.ColumnString('uniqueCode');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        created,
        imageUrl,
        verified,
        private,
        badges,
        uniqueCode,
      ];
}

@Deprecated('Use UserTable.t instead.')
UserTable tUser = UserTable();
