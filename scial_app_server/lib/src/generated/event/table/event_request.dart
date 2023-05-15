/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class EventRequest extends _i1.TableRow {
  EventRequest({
    int? id,
    required this.user,
    required this.companions,
    required this.event,
    required this.created,
    this.text,
    required this.status,
  }) : super(id);

  factory EventRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      companions: serializationManager
          .deserialize<List<int>>(jsonSerialization['companions']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager
          .deserialize<_i2.EventRequestStatus>(jsonSerialization['status']),
    );
  }

  static final t = EventRequestTable();

  int user;

  List<int> companions;

  int event;

  DateTime created;

  String? text;

  _i2.EventRequestStatus status;

  @override
  String get tableName => 'event_requests';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'companions': companions,
      'event': event,
      'created': created,
      'text': text,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'user': user,
      'companions': companions,
      'event': event,
      'created': created,
      'text': text,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'user': user,
      'companions': companions,
      'event': event,
      'created': created,
      'text': text,
      'status': status,
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
      case 'companions':
        companions = value;
        return;
      case 'event':
        event = value;
        return;
      case 'created':
        created = value;
        return;
      case 'text':
        text = value;
        return;
      case 'status':
        status = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<EventRequest>> find(
    _i1.Session session, {
    EventRequestExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventRequest>(
      where: where != null ? where(EventRequest.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventRequest?> findSingleRow(
    _i1.Session session, {
    EventRequestExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EventRequest>(
      where: where != null ? where(EventRequest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventRequest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EventRequest>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventRequestExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventRequest>(
      where: where(EventRequest.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EventRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EventRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EventRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventRequestExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventRequest>(
      where: where != null ? where(EventRequest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventRequestExpressionBuilder = _i1.Expression Function(
    EventRequestTable);

class EventRequestTable extends _i1.Table {
  EventRequestTable() : super(tableName: 'event_requests');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final user = _i1.ColumnInt('user');

  final companions = _i1.ColumnSerializable('companions');

  final event = _i1.ColumnInt('event');

  final created = _i1.ColumnDateTime('created');

  final text = _i1.ColumnString('text');

  final status = _i1.ColumnEnum<_i2.EventRequestStatus>('status');

  @override
  List<_i1.Column> get columns => [
        id,
        user,
        companions,
        event,
        created,
        text,
        status,
      ];
}

@Deprecated('Use EventRequestTable.t instead.')
EventRequestTable tEventRequest = EventRequestTable();
