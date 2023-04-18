/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class AuthSignUpRequest extends _i1.TableRow {
  AuthSignUpRequest({
    int? id,
    required this.email,
    required this.hash,
    required this.verificationCode,
  }) : super(id);

  factory AuthSignUpRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AuthSignUpRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      hash: serializationManager.deserialize<String>(jsonSerialization['hash']),
      verificationCode: serializationManager
          .deserialize<String>(jsonSerialization['verificationCode']),
    );
  }

  static final t = AuthSignUpRequestTable();

  String email;

  String hash;

  String verificationCode;

  @override
  String get tableName => 'auth_sign_up_request';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'hash': hash,
      'verificationCode': verificationCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'email': email,
      'hash': hash,
      'verificationCode': verificationCode,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'email': email,
      'hash': hash,
      'verificationCode': verificationCode,
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
      case 'email':
        email = value;
        return;
      case 'hash':
        hash = value;
        return;
      case 'verificationCode':
        verificationCode = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<AuthSignUpRequest>> find(
    _i1.Session session, {
    AuthSignUpRequestExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AuthSignUpRequest>(
      where: where != null ? where(AuthSignUpRequest.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<AuthSignUpRequest?> findSingleRow(
    _i1.Session session, {
    AuthSignUpRequestExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<AuthSignUpRequest>(
      where: where != null ? where(AuthSignUpRequest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<AuthSignUpRequest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<AuthSignUpRequest>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required AuthSignUpRequestExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AuthSignUpRequest>(
      where: where(AuthSignUpRequest.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    AuthSignUpRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    AuthSignUpRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    AuthSignUpRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    AuthSignUpRequestExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AuthSignUpRequest>(
      where: where != null ? where(AuthSignUpRequest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef AuthSignUpRequestExpressionBuilder = _i1.Expression Function(
    AuthSignUpRequestTable);

class AuthSignUpRequestTable extends _i1.Table {
  AuthSignUpRequestTable() : super(tableName: 'auth_sign_up_request');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final email = _i1.ColumnString('email');

  final hash = _i1.ColumnString('hash');

  final verificationCode = _i1.ColumnString('verificationCode');

  @override
  List<_i1.Column> get columns => [
        id,
        email,
        hash,
        verificationCode,
      ];
}

@Deprecated('Use AuthSignUpRequestTable.t instead.')
AuthSignUpRequestTable tAuthSignUpRequest = AuthSignUpRequestTable();
