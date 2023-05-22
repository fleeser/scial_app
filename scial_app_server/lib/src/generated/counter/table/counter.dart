/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Counter extends _i1.TableRow {
  Counter({
    int? id,
    required this.value,
  }) : super(id);

  factory Counter.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Counter(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      value: serializationManager.deserialize<int>(jsonSerialization['value']),
    );
  }

  static final t = CounterTable();

  int value;

  @override
  String get tableName => 'counters';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'value': value,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'value': value,
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
      case 'value':
        value = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Counter>> find(
    _i1.Session session, {
    CounterExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Counter>(
      where: where != null ? where(Counter.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Counter?> findSingleRow(
    _i1.Session session, {
    CounterExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Counter>(
      where: where != null ? where(Counter.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Counter?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Counter>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CounterExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Counter>(
      where: where(Counter.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Counter row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Counter row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Counter row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CounterExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Counter>(
      where: where != null ? where(Counter.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CounterExpressionBuilder = _i1.Expression Function(CounterTable);

class CounterTable extends _i1.Table {
  CounterTable() : super(tableName: 'counters');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final value = _i1.ColumnInt('value');

  @override
  List<_i1.Column> get columns => [
        id,
        value,
      ];
}

@Deprecated('Use CounterTable.t instead.')
CounterTable tCounter = CounterTable();
