import 'dart:convert';

import 'package:deneme/model/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=58eb92d4e1efe258544a6b59323382b4&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    debugPrint(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
