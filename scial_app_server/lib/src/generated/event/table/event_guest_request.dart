/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class EventGuestRequest extends _i1.TableRow {
  EventGuestRequest({
    int? id,
    required this.user,
    required this.companions,
    required this.event,
    required this.created,
    this.text,
    required this.status,
  }) : super(id);

  factory EventGuestRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventGuestRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      companions: serializationManager
          .deserialize<List<int>>(jsonSerialization['companions']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager.deserialize<_i2.EventGuestRequestStatus>(
          jsonSerialization['status']),
    );
  }

  static final t = EventGuestRequestTable();

  int user;

  List<int> companions;

  int event;

  DateTime created;

  String? text;

  _i2.EventGuestRequestStatus status;

  @override
  String get tableName => 'event_guest_requests';
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

  static Future<List<EventGuestRequest>> find(
    _i1.Session session, {
    EventGuestRequestExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventGuestRequest>(
      where: where != null ? where(EventGuestRequest.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuestRequest?> findSingleRow(
    _i1.Session session, {
    EventGuestRequestExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EventGuestRequest>(
      where: where != null ? where(EventGuestRequest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuestRequest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EventGuestRequest>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventGuestRequestExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventGuestRequest>(
      where: where(EventGuestRequest.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EventGuestRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EventGuestRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EventGuestRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventGuestRequestExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventGuestRequest>(
      where: where != null ? where(EventGuestRequest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventGuestRequestExpressionBuilder = _i1.Expression Function(
    EventGuestRequestTable);

class EventGuestRequestTable extends _i1.Table {
  EventGuestRequestTable() : super(tableName: 'event_guest_requests');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final user = _i1.ColumnInt('user');

  final companions = _i1.ColumnSerializable('companions');

  final event = _i1.ColumnInt('event');

  final created = _i1.ColumnDateTime('created');

  final text = _i1.ColumnString('text');

  final status = _i1.ColumnEnum<_i2.EventGuestRequestStatus>('status');

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

@Deprecated('Use EventGuestRequestTable.t instead.')
EventGuestRequestTable tEventGuestRequest = EventGuestRequestTable();
