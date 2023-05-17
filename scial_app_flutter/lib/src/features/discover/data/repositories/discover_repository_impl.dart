import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/discover/data/data_sources/discover_data_source.dart';
import 'package:scial_app_flutter/src/features/discover/data/data_sources/discover_data_source_impl.dart';
import 'package:scial_app_flutter/src/features/discover/domain/repositories/discover_repository.dart';

part 'discover_repository_impl.g.dart';

@Riverpod(keepAlive: true)
DiscoverRepository discoverRepository(DiscoverRepositoryRef ref) {
  final dataSource = ref.read(discoverDataSourceProvider);
  final discoverRepository = DiscoverRepositoryImpl(dataSource);
  return discoverRepository;
}

class DiscoverRepositoryImpl implements DiscoverRepository {

  const DiscoverRepositoryImpl(this.dataSource);

  final DiscoverDataSource dataSource;

  @override
  Future<List<PublicEvent>> read(double lat, double long, double distance, List<EventType> eventTypes, List<EventVisibility> eventVisibilities) async {
    return await dataSource.read(lat, long, distance, eventTypes, eventVisibilities);
  }
}