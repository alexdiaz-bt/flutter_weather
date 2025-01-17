import 'package:flutter/material.dart';
import 'package:flutter_weather/domain/models/location.dart';
import 'package:flutter_weather/domain/models/weather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({
    super.key,
    required this.input,
    required this.weather,
    required this.location,
    required this.onInputChanged,
    required this.onSearchPressed,
  });

  final String input;
  final Weather? weather;
  final Location? location;

  final Function(String) onInputChanged;
  final VoidCallback onSearchPressed;

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.input)
      ..addListener(() {
        widget.onInputChanged(_textEditingController.value.text);
      });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 24,
          children: [
            Text(
              widget.location?.city ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              widget.weather?.temperature ?? '',
              style: const TextStyle(fontSize: 32),
            ),
            Column(
              spacing: 24,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    label: Text('Location'),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                  onEditingComplete: widget.onSearchPressed,
                ),
                ElevatedButton.icon(
                  onPressed: widget.onSearchPressed,
                  icon: const Icon(Icons.search),
                  label: const Text('Search'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
