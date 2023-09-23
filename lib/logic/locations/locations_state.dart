part of 'locations_cubit.dart';

enum LocationsStatus { initial, loading, success, failure }

class LocationsState extends Equatable {
  final LocationsStatus status;
  final List<LocationModel>? locations;
  final List<LocationModel>? savedLocations;

  const LocationsState({
    this.status = LocationsStatus.initial,
    this.locations,
    this.savedLocations,
  });

  LocationsState copywith(
          {LocationsStatus? status,
          List<LocationModel>? locations,
          List<LocationModel>? savedLocations}) =>
      LocationsState(
          status: status ?? this.status,
          locations: locations ?? this.locations,
          savedLocations: savedLocations ?? this.savedLocations);

  factory LocationsState.fromJson(Map<String, dynamic> json) {
    return LocationsState(
        status: json['status'],
        locations: json['locations'],
        savedLocations: json['savedLocations']);
  }

  LocationsState toMap() {
    return LocationsState(status: status, locations: locations, savedLocations: savedLocations);
  }

  @override
  List<Object?> get props => [status, locations, savedLocations];
}
