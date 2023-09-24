part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherModel? weather;
  final ForecastModel? forecast;

  const WeatherState({this.status = WeatherStatus.initial, this.forecast, this.weather});

  WeatherState copyWith({WeatherStatus? status, WeatherModel? weather, ForecastModel? forecast}) =>
      WeatherState(
          status: status ?? this.status,
          forecast: forecast ?? this.forecast,
          weather: weather ?? this.weather);

  factory WeatherState.fromJson(Map<String, dynamic> json) {
    return WeatherState(
        forecast: json['forecast'], status: json['status'], weather: json['weather']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['forecast'] = forecast;
    data['weather'] = weather;
    return data;
  }

  @override
  List<Object?> get props => [status, forecast, weather];
}
