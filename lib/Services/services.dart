import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_%20model.dart';

class WeatherServices {
  Future<WeatherData> fetchWeather(String city) async {
    const apiKey = "6a14daacf7dfaadd76d8575ea5c408f3";
    final url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return WeatherData.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
