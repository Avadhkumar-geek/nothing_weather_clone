import 'package:nothing_weather_clone/data/dataproviders/accuweather_api.dart';
import 'package:nothing_weather_clone/data/models/forecast_model.dart';
import 'package:nothing_weather_clone/data/models/location_model.dart';
import 'package:nothing_weather_clone/data/models/my_weather_model.dart';
import 'package:nothing_weather_clone/data/models/weather_model.dart';

class WeatherRepo {
  WeatherRepo({AccuWeatherAPI? weatherApiClient});

  Future<List<LocationModel>> getLocation(String query) async {
    final location = await AccuWeatherAPI.getLocation(query);
    return location;
  }

  Future<MyWeatherModel> getWeather(int cityKey) async {
    final weatherFuture = AccuWeatherAPI.getWeatherData(cityKey);
    final forecastFuture = AccuWeatherAPI.getForecastData(cityKey);

    final results = await Future.wait([weatherFuture, forecastFuture]);

    final weather = results[0] as WeatherModel;
    final forecast = results[1] as ForecastModel;
    return MyWeatherModel(weather: weather, forecast: forecast);
  }
}
