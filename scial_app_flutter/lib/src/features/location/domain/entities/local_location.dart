class LocalLocation {

  const LocalLocation({
    this.id,
    required this.lat,
    required this.long,
    required this.name,
    required this.created
  });

  final int? id;
  final double lat;
  final double long;
  final String name;
  final DateTime created;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name' : name,
      'lat' : lat,
      'long' : long,
      'created' : created.millisecondsSinceEpoch
    };
  }

  LocalLocation.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      lat = map['lat'],
      long = map['long'],
      name = map['name'],
      created = DateTime.fromMillisecondsSinceEpoch(map['created']);
}