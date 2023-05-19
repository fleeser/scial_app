import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/local_location.dart';
import 'package:scial_app_flutter/src/services/database_helper.dart';
import 'package:sqflite/sqflite.dart';

part 'location_database_helper.g.dart';

@riverpod
Future<List<LocalLocation>> fetchLocalLocations(FetchLocalLocationsRef ref) async {
  return await LocationDatabaseHelper.getLocations();
}

class LocationDatabaseHelper {

  static String tableName = 'Location';

  static Future<void> insertLocation(LocalLocation location) async {
    Database? database = await DatabaseHelper.instance.database;
    await database!.insert(tableName, location.toMap());
  }

  static Future<List<LocalLocation>> getLocations() async {
    Database? database = await DatabaseHelper.instance.database;
    List<Map<String, Object?>> resultRows = await database!.rawQuery('SELECT * FROM $tableName ORDER BY created DESC'); // TODO or ASC?

    List<LocalLocation> locations = [];

    for (Map<String, Object?> resultRow in resultRows) {
      LocalLocation location = LocalLocation.fromMap(resultRow);
      locations.add(location);
    }

    return locations;
  }
}