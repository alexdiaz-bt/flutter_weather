import 'package:flutter_weather/data/data_sources/weather_database.dart';
import 'package:flutter_weather/domain/models/location.dart';
import 'package:flutter_weather/domain/models/weather.dart';

abstract class WeatherRepository {
  Stream<Location?> currentLocationStream();

  Future<void> persistLocation(Location location);

  Future<Weather> getWeather(Location location);

  Future<Location> getLocation(String input);
}
