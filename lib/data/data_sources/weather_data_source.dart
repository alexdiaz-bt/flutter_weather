import 'package:flutter_weather/data/data_sources/weather_database.dart';
import 'package:flutter_weather/domain/models/location.dart';

class WeatherDataSource {
  final _database = WeatherDatabase();

  Future<int> insertLocation(Location location) async {
    await _database.delete(_database.dbLocation).go();
    return await _database
        .into(_database.dbLocation)
        .insert(DbLocationCompanion.insert(
          lat: location.lat,
          lon: location.lon,
          city: location.city,
        ));
  }

  Stream<DbLocationData?> currentLocationStream() {
    return _database.select(_database.dbLocation).watchSingleOrNull();
  }
}
