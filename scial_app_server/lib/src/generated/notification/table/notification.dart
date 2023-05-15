/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class Notification extends _i1.TableRow {
  Notification({
    int? id,
    required this.created,
    required this.type,
    required this.read,
    required this.ref,
    required this.receiver,
  }) : super(id);

  factory Notification.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Notification(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      type: serializationManager
          .deserialize<_i2.NotificationType>(jsonSerialization['type']),
      read: serializationManager.deserialize<bool>(jsonSerialization['read']),
      ref: serializationManager.deserialize<int>(jsonSerialization['ref']),
      receiver:
          serializationManager.deserialize<int>(jsonSerialization['receiver']),
    );
  }

  static final t = NotificationTable();

  DateTime created;

  _i2.NotificationType type;

  bool read;

  int ref;

  int receiver;

  @override
  String get tableName => 'notifications';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'type': type,
      'read': read,
      'ref': ref,
      'receiver': receiver,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'created': created,
      'type': type,
      'read': read,
      'ref': ref,
      'receiver': receiver,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'created': created,
      'type': type,
      'read': read,
      'ref': ref,
      'receiver': receiver,
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
      case 'read':
        read = value;
        return;
      case 'ref':
        ref = value;
        return;
      case 'receiver':
        receiver = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Notification>> find(
    _i1.Session session, {
    NotificationExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Notification>(
      where: where != null ? where(Notification.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Notification?> findSingleRow(
    _i1.Session session, {
    NotificationExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Notification>(
      where: where != null ? where(Notification.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Notification?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Notification>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required NotificationExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Notification>(
      where: where(Notification.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    NotificationExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Notification>(
      where: where != null ? where(Notification.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef NotificationExpressionBuilder = _i1.Expression Function(
    NotificationTable);

class NotificationTable extends _i1.Table {
  NotificationTable() : super(tableName: 'notifications');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final created = _i1.ColumnDateTime('created');

  final type = _i1.ColumnEnum<_i2.NotificationType>('type');

  final read = _i1.ColumnBool('read');

  final ref = _i1.ColumnInt('ref');

  final receiver = _i1.ColumnInt('receiver');

  @override
  List<_i1.Column> get columns => [
        id,
        created,
        type,
        read,
        ref,
        receiver,
      ];
}

@Deprecated('Use NotificationTable.t instead.')
NotificationTable tNotification = NotificationTable();
