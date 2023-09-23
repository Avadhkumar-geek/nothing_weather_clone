import 'package:nothing_weather_clone/data/dataproviders/accuweather_api.dart';
import 'package:nothing_weather_clone/data/models/location_model.dart';
import 'package:nothing_weather_clone/data/models/my_weather_model.dart';

class WeatherRepo {
  WeatherRepo({AccuWeatherAPI? weatherApiClient});

  Future<List<LocationModel>> getLocation(String query) async {
    final location = await AccuWeatherAPI.getLocation(query);
    return location;
  }

  Future<MyWeatherModel> getWeather(int cityKey) async {
    final weather = await AccuWeatherAPI.getWeatherData(cityKey);
    final forecast = await AccuWeatherAPI.getForecastData(cityKey);

    return MyWeatherModel(weather: weather, forecast: forecast);
  }
}
