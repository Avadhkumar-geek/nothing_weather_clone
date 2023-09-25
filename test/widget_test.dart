import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nothing_weather_clone/data/models/forecast_model.dart';
import 'package:nothing_weather_clone/data/models/my_weather_model.dart';
import 'package:nothing_weather_clone/data/models/weather_model.dart';
import 'package:nothing_weather_clone/data/repository/weather_repo.dart';
import 'package:nothing_weather_clone/logic/weather/weather_cubit.dart';

class MockWeatherRepository extends Mock implements WeatherRepo {}

void main() {
  group('WeatherCubit', () {
    late WeatherRepo weatherRepository;
    late WeatherCubit weatherCubit;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      weatherCubit = WeatherCubit(weatherRepository);
    });

    test('fetchWeather success', () {
      final weather = WeatherModel(
        localObservationDateTime: '2021-10-14T12:00:00+02:00',
        epochTime: 1634217600,
        weatherText: 'Cloudy',
        weatherIcon: 7,
        hasPrecipitation: false,
        isDayTime: true,
        temperature: WeatherTemperature(
          metric: Metric(
            value: 15.0,
            unit: 'C',
            unitType: 17,
            phrase: 'Cool',
          ),
        ),
        realFeelTemperature: WeatherTemperature(
          metric: Metric(
            value: 14.0,
            unit: 'C',
            unitType: 17,
            phrase: 'Cool',
          ),
        ),
        relativeHumidity: 70,
        wind: Wind(
          direction: Direction(
            degrees: 180,
            localized: 'S',
            english: 'S',
          ),
          speed: WeatherTemperature(
            metric: Metric(
              value: 10.0,
              unit: 'km/h',
              unitType: 7,
              phrase: 'Moderate',
            ),
          ),
        ),
        uVIndex: 2,
        uVIndexText: 'Low',
      );

      final forecastModelMockData = ForecastModel(
        headline: Headline(
          effectiveDate: '2022-01-01T07:00:00-05:00',
          effectiveEpochDate: 1641058800,
          severity: 4,
          text: 'Rain and thunderstorms Saturday night through Sunday afternoon',
          category: 'rain',
          endDate: '2022-01-02T19:00:00-05:00',
          endEpochDate: 1641217200,
        ),
        dailyForecasts: [
          DailyForecasts(
            date: '2022-01-01T07:00:00-05:00',
            epochDate: 1641058800,
            sun: Sun(
              rise: '2022-01-01T07:22:00-05:00',
              epochRise: 1641060120,
              set: '2022-01-01T16:47:00-05:00',
              epochSet: 1641094020,
            ),
            temperature: Temperature(
              minimum: Minimum(
                value: 10.0,
                unit: 'F',
                unitType: 18,
              ),
              maximum: Minimum(
                value: 20.0,
                unit: 'F',
                unitType: 18,
              ),
            ),
            airAndPollen: [
              AirAndPollen(
                name: 'AirQuality',
                value: 50,
                category: 'Good',
                categoryValue: 1,
                type: 'Ozone',
              ),
              AirAndPollen(
                name: 'Grass',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'Mold',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'Ragweed',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'Tree',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'UVIndex',
                value: 1,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
            ],
            day: Day(
              icon: 12,
              iconPhrase: 'Showers',
              hasPrecipitation: true,
              precipitationType: 'Rain',
            ),
            mobileLink:
                'http://m.accuweather.com/en/us/new-york-ny/10007/daily-weather-forecast/349727?day=1&lang=en-us',
          ),
          DailyForecasts(
            date: '2022-01-02T07:00:00-05:00',
            epochDate: 1641145200,
            sun: Sun(
              rise: '2022-01-02T07:22:00-05:00',
              epochRise: 1641146520,
              set: '2022-01-02T16:48:00-05:00',
              epochSet: 1641180420,
            ),
            temperature: Temperature(
              minimum: Minimum(
                value: 15.0,
                unit: 'F',
                unitType: 18,
              ),
              maximum: Minimum(
                value: 25.0,
                unit: 'F',
                unitType: 18,
              ),
            ),
            airAndPollen: [
              AirAndPollen(
                name: 'AirQuality',
                value: 50,
                category: 'Good',
                categoryValue: 1,
                type: 'Ozone',
              ),
              AirAndPollen(
                name: 'Grass',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'Mold',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'Ragweed',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'Tree',
                value: 0,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
              AirAndPollen(
                name: 'UVIndex',
                value: 1,
                category: 'Low',
                categoryValue: 1,
                type: '',
              ),
            ],
            day: Day(
              icon: 12,
              iconPhrase: 'Showers',
              hasPrecipitation: true,
              precipitationType: 'Rain',
            ),
            mobileLink:
                'http://m.accuweather.com/en/us/new-york-ny/10007/daily-weather-forecast/349727?day=2&lang=en-us',
          ),
        ],
      );
      when(() => weatherRepository.getWeather(any())).thenAnswer(
        (_) async => MyWeatherModel(weather: weather, forecast: forecastModelMockData),
      );

      final expectedStates = [
        const WeatherState(status: WeatherStatus.loading),
        WeatherState(
            status: WeatherStatus.success, weather: weather, forecast: forecastModelMockData),
      ];

      expectLater(weatherCubit.stream, emitsInOrder(expectedStates));

      weatherCubit.fetchWeather(202441);
    });

    test('fetchWeather failure', () {
      when(() => weatherRepository.getWeather(any())).thenThrow(Exception('An error occurred'));

      final expectedStates = [
        const WeatherState(status: WeatherStatus.loading),
        const WeatherState(status: WeatherStatus.failure),
      ];

      expectLater(weatherCubit.stream, emitsInOrder(expectedStates));

      weatherCubit.fetchWeather(202441);
    });
  });
}
