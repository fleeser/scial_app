/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class EventGuestSuggestion extends _i1.TableRow {
  EventGuestSuggestion({
    int? id,
    required this.sender,
    required this.user,
    required this.event,
    required this.created,
    this.text,
  }) : super(id);

  factory EventGuestSuggestion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventGuestSuggestion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
    );
  }

  static final t = EventGuestSuggestionTable();

  int sender;

  int user;

  int event;

  DateTime created;

  String? text;

  @override
  String get tableName => 'event_guest_suggestions';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'user': user,
      'event': event,
      'created': created,
      'text': text,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'sender': sender,
      'user': user,
      'event': event,
      'created': created,
      'text': text,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'sender': sender,
      'user': user,
      'event': event,
      'created': created,
      'text': text,
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
      case 'user':
        user = value;
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
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<EventGuestSuggestion>> find(
    _i1.Session session, {
    EventGuestSuggestionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventGuestSuggestion>(
      where: where != null ? where(EventGuestSuggestion.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuestSuggestion?> findSingleRow(
    _i1.Session session, {
    EventGuestSuggestionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EventGuestSuggestion>(
      where: where != null ? where(EventGuestSuggestion.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuestSuggestion?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EventGuestSuggestion>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventGuestSuggestionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventGuestSuggestion>(
      where: where(EventGuestSuggestion.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EventGuestSuggestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EventGuestSuggestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EventGuestSuggestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventGuestSuggestionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventGuestSuggestion>(
      where: where != null ? where(EventGuestSuggestion.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventGuestSuggestionExpressionBuilder = _i1.Expression Function(
    EventGuestSuggestionTable);

class EventGuestSuggestionTable extends _i1.Table {
  EventGuestSuggestionTable() : super(tableName: 'event_guest_suggestions');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final sender = _i1.ColumnInt('sender');

  final user = _i1.ColumnInt('user');

  final event = _i1.ColumnInt('event');

  final created = _i1.ColumnDateTime('created');

  final text = _i1.ColumnString('text');

  @override
  List<_i1.Column> get columns => [
        id,
        sender,
        user,
        event,
        created,
        text,
      ];
}

@Deprecated('Use EventGuestSuggestionTable.t instead.')
EventGuestSuggestionTable tEventGuestSuggestion = EventGuestSuggestionTable();
