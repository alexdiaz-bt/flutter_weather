class Location {
  const Location({
    required this.city,
    required this.lat,
    required this.lon,
  });

  final String city;
  final double lat;
  final double lon;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['display_name'],
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
    );
  }
}
