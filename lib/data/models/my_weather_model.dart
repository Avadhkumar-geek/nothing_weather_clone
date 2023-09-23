import 'package:nothing_weather_clone/data/models/forecast_model.dart';
import 'package:nothing_weather_clone/data/models/weather_model.dart';

class MyWeatherModel {
  final WeatherModel weather;
  final ForecastModel forecast;

  MyWeatherModel({required this.weather, required this.forecast});

  factory MyWeatherModel.fromJson(Map<String, dynamic> json) {
    return MyWeatherModel(
      weather: WeatherModel.fromJson(json['weather']),
      forecast: ForecastModel.fromJson(json['forecast']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weather': weather.toJson(),
      'forecast': forecast.toJson(),
    };
  }
}
