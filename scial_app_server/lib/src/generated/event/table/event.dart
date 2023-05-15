/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

class Event extends _i1.TableRow {
  Event({
    int? id,
    required this.type,
    required this.visibility,
    required this.created,
    required this.title,
    required this.verified,
    required this.hosts,
    required this.lat,
    required this.long,
    this.description,
    required this.start,
    required this.end,
    this.imageUrl,
  }) : super(id);

  factory Event.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Event(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      type: serializationManager
          .deserialize<_i2.EventType>(jsonSerialization['type']),
      visibility: serializationManager
          .deserialize<_i2.EventVisibility>(jsonSerialization['visibility']),
      created: serializationManager
          .deserialize<DateTime>(jsonSerialization['created']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      verified:
          serializationManager.deserialize<bool>(jsonSerialization['verified']),
      hosts: serializationManager
          .deserialize<List<int>>(jsonSerialization['hosts']),
      lat: serializationManager.deserialize<double>(jsonSerialization['lat']),
      long: serializationManager.deserialize<double>(jsonSerialization['long']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      start: serializationManager
          .deserialize<DateTime>(jsonSerialization['start']),
      end: serializationManager.deserialize<DateTime>(jsonSerialization['end']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
    );
  }

  static final t = EventTable();

  _i2.EventType type;

  _i2.EventVisibility visibility;

  DateTime created;

  String title;

  bool verified;

  List<int> hosts;

  double lat;

  double long;

  String? description;

  DateTime start;

  DateTime end;

  String? imageUrl;

  @override
  String get tableName => 'events';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'visibility': visibility,
      'created': created,
      'title': title,
      'verified': verified,
      'hosts': hosts,
      'lat': lat,
      'long': long,
      'description': description,
      'start': start,
      'end': end,
      'imageUrl': imageUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'type': type,
      'visibility': visibility,
      'created': created,
      'title': title,
      'verified': verified,
      'hosts': hosts,
      'lat': lat,
      'long': long,
      'description': description,
      'start': start,
      'end': end,
      'imageUrl': imageUrl,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'type': type,
      'visibility': visibility,
      'created': created,
      'title': title,
      'verified': verified,
      'hosts': hosts,
      'lat': lat,
      'long': long,
      'description': description,
      'start': start,
      'end': end,
      'imageUrl': imageUrl,
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
      case 'type':
        type = value;
        return;
      case 'visibility':
        visibility = value;
        return;
      case 'created':
        created = value;
        return;
      case 'title':
        title = value;
        return;
      case 'verified':
        verified = value;
        return;
      case 'hosts':
        hosts = value;
        return;
      case 'lat':
        lat = value;
        return;
      case 'long':
        long = value;
        return;
      case 'description':
        description = value;
        return;
      case 'start':
        start = value;
        return;
      case 'end':
        end = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Event>> find(
    _i1.Session session, {
    EventExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Event>(
      where: where != null ? where(Event.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Event?> findSingleRow(
    _i1.Session session, {
    EventExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Event>(
      where: where != null ? where(Event.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Event?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Event>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EventExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Event>(
      where: where(Event.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Event row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Event row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Event row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EventExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Event>(
      where: where != null ? where(Event.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EventExpressionBuilder = _i1.Expression Function(EventTable);

class EventTable extends _i1.Table {
  EventTable() : super(tableName: 'events');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final type = _i1.ColumnEnum<_i2.EventType>('type');

  final visibility = _i1.ColumnEnum<_i2.EventVisibility>('visibility');

  final created = _i1.ColumnDateTime('created');

  final title = _i1.ColumnString('title');

  final verified = _i1.ColumnBool('verified');

  final hosts = _i1.ColumnSerializable('hosts');

  final lat = _i1.ColumnDouble('lat');

  final long = _i1.ColumnDouble('long');

  final description = _i1.ColumnString('description');

  final start = _i1.ColumnDateTime('start');

  final end = _i1.ColumnDateTime('end');

  final imageUrl = _i1.ColumnString('imageUrl');

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        visibility,
        created,
        title,
        verified,
        hosts,
        lat,
        long,
        description,
        start,
        end,
        imageUrl,
      ];
}

@Deprecated('Use EventTable.t instead.')
EventTable tEvent = EventTable();
