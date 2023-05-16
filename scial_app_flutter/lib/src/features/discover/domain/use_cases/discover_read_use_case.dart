import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/discover/data/repositories/discover_repository_impl.dart';
import 'package:scial_app_flutter/src/features/discover/domain/repositories/discover_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'discover_read_use_case.g.dart';

@riverpod
DiscoverReadUseCase discoverReadUseCase(DiscoverReadUseCaseRef ref) => DiscoverReadUseCase(ref.read(discoverRepositoryProvider));

class DiscoverReadUseCase implements FutureUseCase<void, DiscoverReadUseCaseParams> {

  const DiscoverReadUseCase(this.repository);

  final DiscoverRepository repository;

  @override
  Future<List<PublicEvent>> call(DiscoverReadUseCaseParams params) async {
    return await repository.read(params.lat, params.long, params.eventTypes);
  }
}

class DiscoverReadUseCaseParams extends Equatable {

  const DiscoverReadUseCaseParams({
    required this.lat,
    required this.long,
    required this.eventTypes
  });

  final double lat;
  final double long;
  final List<EventType> eventTypes;
  
  @override
  List<Object?> get props => [ lat, long, eventTypes ];
}