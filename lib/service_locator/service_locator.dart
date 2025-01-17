import 'package:flutter_weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_weather/data/network/weather_network_client.dart';
import 'package:flutter_weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather/presentation/weather_view_model.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<WeatherViewModel>(
    () => WeatherViewModel(),
  );
  serviceLocator.registerLazySingleton<WeatherNetworkClient>(
    () => WeatherNetworkClient(),
  );
  serviceLocator.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSource(),
  );
  serviceLocator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(),
  );
}
