import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/domain/models/location.dart';
import 'package:flutter_weather/domain/models/weather.dart';
import 'package:flutter_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather/service_locator/service_locator.dart';

class WeatherViewModel extends Cubit<WeatherViewState> {
  final _weatherRepository = serviceLocator<WeatherRepository>();
  final _errorController = StreamController<String>();
  late final StreamSubscription<Location?> _currentLocationStreamSubscription;

  Stream<String> get errorStream => _errorController.stream;

  WeatherViewModel() : super(WeatherViewState()) {
    _currentLocationStreamSubscription =
        _weatherRepository.currentLocationStream().listen((location) async {
      if (location == null) {
        return;
      }

      try {
        final weather = await _weatherRepository.getWeather(location);
        emit(state.copyWith(weather: weather, location: location));
      } catch (e) {
        addError(e);
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    _errorController.add(error.toString());
  }

  @override
  Future<void> close() {
    _errorController.close();
    _currentLocationStreamSubscription.cancel();
    return super.close();
  }

  void onInputChanged(String input) {
    emit(state.copyWith(input: input));
  }

  void onSearchPressed() {
    if (state.input.isEmpty) {
      addError(ErrorDescription('Please insert a location'));
      return;
    }

    Future(() async {
      try {
        final location = await _weatherRepository.getLocation(state.input);
        await _weatherRepository.persistLocation(location);
      } catch (e) {
        addError(e);
      }
    });
  }
}

class WeatherViewState {
  const WeatherViewState({
    this.input = '',
    this.weather,
    this.location,
  });

  final String input;
  final Weather? weather;
  final Location? location;

  WeatherViewState copyWith({
    String? input,
    Weather? weather,
    Location? location,
  }) {
    return WeatherViewState(
      input: input ?? this.input,
      weather: weather ?? this.weather,
      location: location ?? this.location,
    );
  }
}
