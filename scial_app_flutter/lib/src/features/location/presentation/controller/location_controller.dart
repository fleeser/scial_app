import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_search/mapbox_search.dart' as mbs;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:location/location.dart';
import 'package:scial_app_flutter/src/exceptions/app_exception.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/base_location.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {

  @override
  FutureOr<BaseLocation> build() async {
    return await _fetchCurrentLocation();
  }

  Future<BaseLocation> _fetchCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();

      if (!serviceEnabled) throw const AppException.locationServiceDisabled();
    }

    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.deniedForever) throw const AppException.locationDeniedForever();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();

      if (permissionStatus == PermissionStatus.deniedForever) throw const AppException.locationDeniedForever();

      if (permissionStatus == PermissionStatus.denied) throw const AppException.locationDenied();
    }

    LocationData locationData = await location.getLocation();

    if (locationData.latitude == null || locationData.longitude == null) throw const AppException.locationPointNotFound();

    mbs.ReverseGeoCoding reverseGeoCoding = mbs.ReverseGeoCoding(apiKey: dotenv.env['MAPBOX_API_KEY']!);

    List<mbs.MapBoxPlace>? addresses = await reverseGeoCoding.getAddress(mbs.Location(lat: locationData.latitude!, lng: locationData.longitude!));

    if (addresses == null || addresses.isEmpty) {
      return BaseLocation(
        lat: locationData.latitude!,
        long: locationData.longitude!
      );
    }

    return BaseLocation(
      lat: locationData.latitude!, 
      long: locationData.longitude!,
      name: addresses.first.placeName
    );
  }

  void setLocation(BaseLocation location) {
    state = AsyncValue.data(location);
  }
}