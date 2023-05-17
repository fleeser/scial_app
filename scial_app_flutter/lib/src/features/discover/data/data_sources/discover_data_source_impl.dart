import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/main.dart';
import 'package:scial_app_flutter/src/exceptions/server_exception.dart';
import 'package:scial_app_flutter/src/features/discover/data/data_sources/discover_data_source.dart';

part 'discover_data_source_impl.g.dart';

@riverpod
DiscoverDataSource discoverDataSource(DiscoverDataSourceRef ref) => DiscoverDataSourceImpl();

class DiscoverDataSourceImpl implements DiscoverDataSource {

  @override
  Future<List<PublicEvent>> read(double lat, double long, double distance, List<EventType> eventTypes, List<EventVisibility> eventVisibilities) async {
    DiscoverReadResponse response = await client.discover.read(lat, long, distance, eventTypes, eventVisibilities);

    if (response.success) return response.events!;
    
    switch (response.code) {
      case DiscoverReadResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      default: throw const ServerException.unknownError();
    }
  }
}