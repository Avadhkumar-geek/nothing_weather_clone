import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nothing_weather_clone/data/models/forecast_model.dart';
import 'package:nothing_weather_clone/data/models/geolocation_key_model.dart';
import 'package:nothing_weather_clone/data/models/location_model.dart';
import 'package:nothing_weather_clone/data/models/weather_model.dart';
import 'package:nothing_weather_clone/secret.dart';

class AccuWeatherAPI {
  static const String _baseUrl = "dataservice.accuweather.com";

  static Future<List<LocationModel>> getLocation(String query) async {
    final locationRequest = Uri.https(_baseUrl,
        '/locations/v1/cities/autocomplete', {"q": query, "apikey": apiKey});

    final locationResponse = await http.get(locationRequest);

    if (locationResponse.statusCode != 200) {
      throw 'No location Found';
    }

    final locationJson = jsonDecode(locationResponse.body) as List;

    final locationList =
        locationJson.map((e) => LocationModel.fromJson(e)).toList();

    return locationList;
  }

  static Future<WeatherModel> getWeatherData(int cityCode) async {
    final weatherRequest = Uri.https(
        _baseUrl,
        '/currentconditions/v1/$cityCode',
        {"apikey": apiKey, "details": "true"});

    final weatherResponse = await http.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      log(weatherResponse.body);
      throw 'No data available';
    }

    final weatherJson = jsonDecode(weatherResponse.body) as List;

    final weatherData = WeatherModel.fromJson(weatherJson.first);

    return weatherData;
  }

  static Future<ForecastModel> getForecastData(int cityCode) async {
    final forecastRequest = Uri.https(
        _baseUrl,
        '/forecasts/v1/daily/5day/$cityCode',
        {"apikey": apiKey, "details": "true", "metric": "true"});

    final forecastResponse = await http.get(forecastRequest);

    if (forecastResponse.statusCode != 200) {
      throw 'No data available';
    }

    final forecastJson =
        jsonDecode(forecastResponse.body) as Map<String, dynamic>;

    final forecastData = ForecastModel.fromJson(forecastJson);

    return forecastData;
  }

  static Future<int> getGeoPositionnKey(
      double latitude, double longitude) async {
    final positionRequest = Uri.https(
        _baseUrl,
        '/locations/v1/cities/geoposition/search',
        {"apikey": apiKey, "q": "$latitude,$longitude"});

    final positionResponse = await http.get(positionRequest);

    if (positionResponse.statusCode != 200) {
      throw 'No data available';
    }

    final positionJson =
        jsonDecode(positionResponse.body) as Map<String, dynamic>;

    final positionData = GeoPositionKeyModel.fromJson(positionJson);

    return int.parse(positionData.locationKey);
  }
}
