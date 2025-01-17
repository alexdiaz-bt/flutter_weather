import 'dart:convert';

import 'package:flutter_weather/domain/models/location.dart';
import 'package:flutter_weather/domain/models/weather.dart';
import 'package:http/http.dart' as http;

const _openStreetMapApi = 'https://nominatim.openstreetmap.org/';
const _openMeteoApi = 'https://api.open-meteo.com/v1/';

class WeatherNetworkClient {
  Future<Weather> getWeather(Location location) async {
    final uri =
        '$_openMeteoApi/forecast?current=temperature&latitude=${location.lat}&longitude=${location.lon}';
    final response = await http.get(Uri.parse(uri));
    return Weather.fromJson(json.decode(response.body));
  }

  Future<Location> getCoordinates(String input) async {
    final uri = '$_openStreetMapApi/search?q=$input&format=json&limit=1';
    final response = await http.get(Uri.parse(uri));

    return (json.decode(response.body) as List)
        .map((i) => Location.fromJson(i))
        .first;
  }
}
