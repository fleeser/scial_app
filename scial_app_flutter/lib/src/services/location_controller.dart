import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_search/mapbox_search.dart' as mbs;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:location/location.dart';

part 'location_controller.g.dart';

class LocationModel {

  const LocationModel({
    required this.lat,
    required this.long,
    this.name
  });

  final double lat;
  final double long;
  final String? name;
}

@riverpod
class LocationController extends _$LocationController {

  @override
  FutureOr<LocationModel?> build() async {
    return await _fetch();
  }

  Future<LocationModel?> _fetch() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();

      if (!serviceEnabled) return null; // throw const AppException.locationServiceDisabled();
    }

    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.deniedForever) return null; // throw const AppException.locationDeniedForever();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();

      if (permissionStatus == PermissionStatus.deniedForever) return null; // throw const AppException.locationDeniedForever();

      if (permissionStatus == PermissionStatus.denied) return null; // throw const AppException.locationDenied();
    }

    LocationData locationData = await location.getLocation();

    if (locationData.latitude == null || locationData.longitude == null) return null; // throw const AppException.locationPointNotFound();

    mbs.ReverseGeoCoding reverseGeoCoding = mbs.ReverseGeoCoding(apiKey: dotenv.env['MAPBOX_API_KEY']!);

    List<mbs.MapBoxPlace>? addresses = await reverseGeoCoding.getAddress(mbs.Location(lat: locationData.latitude!, lng: locationData.longitude!));

    String? name;
    if (addresses == null || addresses.isEmpty) {
      // throw const AppException.locationPointNotFound();
    } else {
      name = addresses.first.placeName;
    }

    return LocationModel(
      lat: locationData.latitude!, 
      long: locationData.longitude!,
      name: name
    );
  }
}