import 'package:flutter_weather/data/data_sources/weather_database.dart';
import 'package:flutter_weather/domain/models/location.dart';

extension DbLocationDataExtension on DbLocationData {
  Location toLocation() {
    return Location(city: city, lat: lat, lon: lon);
  }
}
