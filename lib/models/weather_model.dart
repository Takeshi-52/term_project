class Weather {
  String? cityName;
  double? temperature;
  double? temp_min;
  double? temp_max;
  String? description;
  String? weat_icon;
  int? sunrise;
  int? sunset;
  double? pressure;
  int? humidity;
  double? wind;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.temp_min,
    required this.temp_max,
    required this.description,
    required this.weat_icon,
    required this.humidity,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.wind,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      temp_min: json['main']['temp_min'],
      temp_max: json['main']['temp_max'],
      description: json['weather'][0]['description'],
      weat_icon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      wind: json['wind']['speed'],
    );
  }
}
