/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class EventGuest extends _i1.TableRow {
  EventGuest({
    int? id,
    required this.user,
    required this.event,
    required this.created,
  }) : super(id);

  factory EventGuest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventGuest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
    );
  }

  static final t = EventGuestTable();

  int user;

  int event;

  DateTime created;

  @override
  String get tableName => 'event_guests';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'event': event,
      'created': created,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'user': user,
      'event': event,
      'created': created,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'user': user,
      'event': event,
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
      case 'user':
        user = value;
        return;
      case 'event':
        event = value;
        return;
      case 'created':
        created = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<EventGuest>> find(
    _i1.Session session, {
    EventGuestExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventGuest>(
      where: where != null ? where(EventGuest.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuest?> findSingleRow(
    _i1.Session session, {
    EventGuestExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EventGuest>(
      where: where != null ? where(EventGuest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EventGuest>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventGuestExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventGuest>(
      where: where(EventGuest.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EventGuest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EventGuest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EventGuest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventGuestExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventGuest>(
      where: where != null ? where(EventGuest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventGuestExpressionBuilder = _i1.Expression Function(EventGuestTable);

class EventGuestTable extends _i1.Table {
  EventGuestTable() : super(tableName: 'event_guests');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final user = _i1.ColumnInt('user');

  final event = _i1.ColumnInt('event');

  final created = _i1.ColumnDateTime('created');

  @override
  List<_i1.Column> get columns => [
        id,
        user,
        event,
        created,
      ];
}

@Deprecated('Use EventGuestTable.t instead.')
EventGuestTable tEventGuest = EventGuestTable();
