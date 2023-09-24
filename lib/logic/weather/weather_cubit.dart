import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing_weather_clone/data/models/forecast_model.dart';
import 'package:nothing_weather_clone/data/repository/weather_repo.dart';

import '../../data/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo weatherRepo;

  WeatherCubit(this.weatherRepo)
      : super(const WeatherState(status: WeatherStatus.initial));

  Future<void> fetchWeather(int? cityKey) async {
    if (cityKey == null) {
      emit(state.copyWith(status: WeatherStatus.failure));
      return;
    }

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = await weatherRepo.getWeather(cityKey);
      emit(state.copyWith(
          status: WeatherStatus.success,
          forecast: weather.forecast,
          weather: weather.weather));
    } catch (_) {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  void error() {
    emit(state.copyWith(status: WeatherStatus.failure));
  }
}
