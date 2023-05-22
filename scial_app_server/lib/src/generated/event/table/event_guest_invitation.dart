/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class EventGuestInvitation extends _i1.TableRow {
  EventGuestInvitation({
    int? id,
    required this.user,
    required this.sender,
    required this.event,
    required this.created,
    this.text,
    required this.status,
  }) : super(id);

  factory EventGuestInvitation.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EventGuestInvitation(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      user: serializationManager.deserialize<int>(jsonSerialization['user']),
      sender:
          serializationManager.deserialize<int>(jsonSerialization['sender']),
      event: serializationManager.deserialize<int>(jsonSerialization['event']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      text:
          serializationManager.deserialize<String?>(jsonSerialization['text']),
      status: serializationManager.deserialize<_i2.EventGuestInvitationStatus>(
          jsonSerialization['status']),
    );
  }

  static final t = EventGuestInvitationTable();

  int user;

  int sender;

  int event;

  DateTime created;

  String? text;

  _i2.EventGuestInvitationStatus status;

  @override
  String get tableName => 'event_guest_invitations';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'sender': sender,
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
      'sender': sender,
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
      'sender': sender,
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
      case 'sender':
        sender = value;
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

  static Future<List<EventGuestInvitation>> find(
    _i1.Session session, {
    EventGuestInvitationExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventGuestInvitation>(
      where: where != null ? where(EventGuestInvitation.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuestInvitation?> findSingleRow(
    _i1.Session session, {
    EventGuestInvitationExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EventGuestInvitation>(
      where: where != null ? where(EventGuestInvitation.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EventGuestInvitation?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EventGuestInvitation>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventGuestInvitationExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventGuestInvitation>(
      where: where(EventGuestInvitation.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EventGuestInvitation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EventGuestInvitation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EventGuestInvitation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventGuestInvitationExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventGuestInvitation>(
      where: where != null ? where(EventGuestInvitation.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventGuestInvitationExpressionBuilder = _i1.Expression Function(
    EventGuestInvitationTable);

class EventGuestInvitationTable extends _i1.Table {
  EventGuestInvitationTable() : super(tableName: 'event_guest_invitations');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final user = _i1.ColumnInt('user');

  final sender = _i1.ColumnInt('sender');

  final event = _i1.ColumnInt('event');

  final created = _i1.ColumnDateTime('created');

  final text = _i1.ColumnString('text');

  final status = _i1.ColumnEnum<_i2.EventGuestInvitationStatus>('status');

  @override
  List<_i1.Column> get columns => [
        id,
        user,
        sender,
        event,
        created,
        text,
        status,
      ];
}

@Deprecated('Use EventGuestInvitationTable.t instead.')
EventGuestInvitationTable tEventGuestInvitation = EventGuestInvitationTable();
