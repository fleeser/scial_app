/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class EventHostSuggestion extends _i1.TableRow {
  EventHostSuggestion({
    int? id,
    required this.sender,
    required this.users,
    required this.event,
    required this.created,
    this.text,
    required this.status,
  }) : super(id);

  factory EventHostSuggestion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventHostSuggestion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      users: serializationManager
          .deserialize<List<int>>(jsonSerialization['users']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager.deserialize<_i2.EventHostSuggestionStatus>(
          jsonSerialization['status']),
    );
  }

  static final t = EventHostSuggestionTable();

  int sender;

  List<int> users;

  int event;

  DateTime created;

  String? text;

  _i2.EventHostSuggestionStatus status;

  @override
  String get tableName => 'event_host_suggestions';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'users': users,
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
      'sender': sender,
      'users': users,
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
      'sender': sender,
      'users': users,
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
      case 'sender':
        sender = value;
        return;
      case 'users':
        users = value;
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

  static Future<List<EventHostSuggestion>> find(
    _i1.Session session, {
    EventHostSuggestionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventHostSuggestion>(
      where: where != null ? where(EventHostSuggestion.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventHostSuggestion?> findSingleRow(
    _i1.Session session, {
    EventHostSuggestionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EventHostSuggestion>(
      where: where != null ? where(EventHostSuggestion.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventHostSuggestion?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EventHostSuggestion>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventHostSuggestionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventHostSuggestion>(
      where: where(EventHostSuggestion.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EventHostSuggestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EventHostSuggestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EventHostSuggestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventHostSuggestionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventHostSuggestion>(
      where: where != null ? where(EventHostSuggestion.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventHostSuggestionExpressionBuilder = _i1.Expression Function(
    EventHostSuggestionTable);

class EventHostSuggestionTable extends _i1.Table {
  EventHostSuggestionTable() : super(tableName: 'event_host_suggestions');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final sender = _i1.ColumnInt('sender');

  final users = _i1.ColumnSerializable('users');

  final event = _i1.ColumnInt('event');

  final created = _i1.ColumnDateTime('created');

  final text = _i1.ColumnString('text');

  final status = _i1.ColumnEnum<_i2.EventHostSuggestionStatus>('status');

  @override
  List<_i1.Column> get columns => [
        id,
        sender,
        users,
        event,
        created,
        text,
        status,
      ];
}

@Deprecated('Use EventHostSuggestionTable.t instead.')
EventHostSuggestionTable tEventHostSuggestion = EventHostSuggestionTable();
