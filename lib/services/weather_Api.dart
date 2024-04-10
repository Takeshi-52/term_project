import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:term_project/models/weather_model.dart';

class WeatherApiCaller {
  static const baseUrl = 'http://api.openweathermap.org/data/2.5/weather';
  static const apiKey = '79a4d6c4f05f607c4ad8f49612057767';

  Future<Weather>? getCurrentWeather(String location) async {
    final response = await http
        .get(Uri.parse('$baseUrl?q=$location&appid=$apiKey&units=metric'));
    print(Weather.fromJson(jsonDecode(response.body)).cityName);
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
