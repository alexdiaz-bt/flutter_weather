class Weather {
  const Weather({required this.temperature});

  final String temperature;

  factory Weather.fromJson(Map<String, dynamic> json) {
    final temperature = json['current']['temperature'];
    final unit = json['current_units']['temperature'];
    return Weather(temperature: "$temperature $unit");
  }
}
