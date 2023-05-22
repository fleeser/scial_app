/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class EventHost extends _i1.TableRow {
  EventHost({
    int? id,
    required this.user,
    required this.event,
  }) : super(id);

  factory EventHost.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventHost(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
    );
  }

  static final t = EventHostTable();

  int user;

  int event;

  @override
  String get tableName => 'event_hosts';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'event': event,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'user': user,
      'event': event,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'user': user,
      'event': event,
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
      case 'user':
        user = value;
        return;
      case 'event':
        event = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<EventHost>> find(
    _i1.Session session, {
    EventHostExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventHost>(
      where: where != null ? where(EventHost.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventHost?> findSingleRow(
    _i1.Session session, {
    EventHostExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EventHost>(
      where: where != null ? where(EventHost.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventHost?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EventHost>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventHostExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventHost>(
      where: where(EventHost.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EventHost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EventHost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EventHost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventHostExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventHost>(
      where: where != null ? where(EventHost.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventHostExpressionBuilder = _i1.Expression Function(EventHostTable);

class EventHostTable extends _i1.Table {
  EventHostTable() : super(tableName: 'event_hosts');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final user = _i1.ColumnInt('user');

  final event = _i1.ColumnInt('event');

  @override
  List<_i1.Column> get columns => [
        id,
        user,
        event,
      ];
}

@Deprecated('Use EventHostTable.t instead.')
EventHostTable tEventHost = EventHostTable();
