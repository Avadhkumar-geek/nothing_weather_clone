import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing_weather_clone/data/models/location_model.dart';
import 'package:nothing_weather_clone/data/repository/weather_repo.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  final WeatherRepo weatherRepo;
  final List<LocationModel> savedLocations = [];

  LocationsCubit(this.weatherRepo) : super(const LocationsState());

  Future<void> locationsList(String query) async {
    List<LocationModel> locations = [];

    emit(state.copywith(status: LocationsStatus.loading));

    final locationsList = await weatherRepo.getLocation(query);
    locations = locationsList;

    emit(state.copywith(status: LocationsStatus.success, locations: locations));
  }

  Future<void> addLocation(LocationModel location) async {
    savedLocations.add(location);
    emit(state.copywith(
        status: LocationsStatus.success, savedLocations: savedLocations));
  }
}
