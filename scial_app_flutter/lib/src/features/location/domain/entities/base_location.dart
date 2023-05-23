class BaseLocation {

  const BaseLocation({
    required this.lat,
    required this.long,
    this.name
  });

  final double lat;
  final double long;
  final String? name;
}