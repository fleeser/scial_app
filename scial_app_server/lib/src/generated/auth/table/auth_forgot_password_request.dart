/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class AuthForgotPasswordRequest extends _i1.TableRow {
  AuthForgotPasswordRequest({
    int? id,
    required this.email,
    required this.verificationCode,
  }) : super(id);

  factory AuthForgotPasswordRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AuthForgotPasswordRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      verificationCode: serializationManager
          .deserialize<String>(jsonSerialization['verificationCode']),
    );
  }

  static final t = AuthForgotPasswordRequestTable();

  String email;

  String verificationCode;

  @override
  String get tableName => 'auth_forgot_password_request';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'verificationCode': verificationCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'email': email,
      'verificationCode': verificationCode,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'email': email,
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
      case 'verificationCode':
        verificationCode = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<AuthForgotPasswordRequest>> find(
    _i1.Session session, {
    AuthForgotPasswordRequestExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AuthForgotPasswordRequest>(
      where: where != null ? where(AuthForgotPasswordRequest.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<AuthForgotPasswordRequest?> findSingleRow(
    _i1.Session session, {
    AuthForgotPasswordRequestExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<AuthForgotPasswordRequest>(
      where: where != null ? where(AuthForgotPasswordRequest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<AuthForgotPasswordRequest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<AuthForgotPasswordRequest>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required AuthForgotPasswordRequestExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AuthForgotPasswordRequest>(
      where: where(AuthForgotPasswordRequest.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    AuthForgotPasswordRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    AuthForgotPasswordRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    AuthForgotPasswordRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    AuthForgotPasswordRequestExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AuthForgotPasswordRequest>(
      where: where != null ? where(AuthForgotPasswordRequest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef AuthForgotPasswordRequestExpressionBuilder = _i1.Expression Function(
    AuthForgotPasswordRequestTable);

class AuthForgotPasswordRequestTable extends _i1.Table {
  AuthForgotPasswordRequestTable()
      : super(tableName: 'auth_forgot_password_request');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final email = _i1.ColumnString('email');

  final verificationCode = _i1.ColumnString('verificationCode');

  @override
  List<_i1.Column> get columns => [
        id,
        email,
        verificationCode,
      ];
}

@Deprecated('Use AuthForgotPasswordRequestTable.t instead.')
AuthForgotPasswordRequestTable tAuthForgotPasswordRequest =
    AuthForgotPasswordRequestTable();
