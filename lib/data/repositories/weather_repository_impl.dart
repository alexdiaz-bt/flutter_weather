import 'package:flutter_weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_weather/data/extension/location_extension.dart';
import 'package:flutter_weather/data/network/weather_network_client.dart';
import 'package:flutter_weather/domain/models/location.dart';
import 'package:flutter_weather/domain/models/weather.dart';
import 'package:flutter_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather/service_locator/service_locator.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final _networkClient = serviceLocator<WeatherNetworkClient>();
  final _dataSource = serviceLocator<WeatherDataSource>();

  @override
  Future<Weather> getWeather(Location location) {
    return _networkClient.getWeather(location);
  }

  @override
  Future<Location> getLocation(String input) {
    return _networkClient.getCoordinates(input);
  }

  @override
  Future<void> persistLocation(Location location) async {
    await _dataSource.insertLocation(location);
  }

  @override
  Stream<Location?> currentLocationStream() {
    return _dataSource
        .currentLocationStream()
        .map((dbLocation) => dbLocation?.toLocation());
  }
}
