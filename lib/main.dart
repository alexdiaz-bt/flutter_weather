import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/presentation/weather_view_model.dart';
import 'package:flutter_weather/presentation/weather_widget.dart';

import 'service_locator/service_locator.dart';

final _themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xfd47bfdf)),
  fontFamily: "Roboto",
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  runApp(
    SafeArea(
      child: MaterialApp(
        theme: _themeData,
        home: const Root(),
      ),
    ),
  );
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final _viewModel = serviceLocator<WeatherViewModel>();
  late StreamSubscription _errorSubscription;

  @override
  void initState() {
    super.initState();
    _errorSubscription = _viewModel.errorStream.listen((message) async {
      if (mounted) {
        _showErrorDialog(message);
      }
    });
  }

  @override
  void dispose() {
    _errorSubscription.cancel();
    _viewModel.close();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error!'),
          content: Text('There was an error: $message'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherViewModel, WeatherViewState>(
      bloc: _viewModel,
      builder: (context, state) {
        return WeatherWidget(
          input: state.input,
          weather: state.weather,
          location: state.location,
          onInputChanged: _viewModel.onInputChanged,
          onSearchPressed: _viewModel.onSearchPressed,
        );
      },
    );
  }
}
