import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nothing_weather_clone/data/dataproviders/accuweather_api.dart';

part 'user_permission_state.dart';

class UserPermissionCubit extends Cubit<UserPermissionState> {
  UserPermissionCubit() : super(const UserPermissionState());
  Future<void> getUserPermission() async {
    Position? locationData;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(state.copywith(status: PermissionStatus.denied));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(state.copywith(status: PermissionStatus.denied));
      }
    }

    locationData = await Geolocator.getCurrentPosition();
    await AccuWeatherAPI.getGeoPositionnKey(locationData.latitude, locationData.longitude)
        .then((positionKey) {
      emit(state.copywith(status: PermissionStatus.always, positionKey: positionKey));
      return 0;
    });
    // log('${_locationData!.latitude!.toString()}, ${_locationData!.longitude!.toString()}}');
    // return null;
  }
}
