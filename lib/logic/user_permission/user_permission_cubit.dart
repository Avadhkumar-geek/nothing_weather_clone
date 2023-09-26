import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nothing_weather_clone/data/dataproviders/accuweather_api.dart';

part 'user_permission_state.dart';

class UserPermissionCubit extends Cubit<UserPermissionState> {
  bool isDeniedForever = false;

  UserPermissionCubit() : super(const UserPermissionState());

  Future<void> getUserPermission() async {
    try {
      if (isDeniedForever) {
        emit(state.copyWith(status: PermissionStatus.deniedForever));
        return;
      }

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(state.copyWith(status: PermissionStatus.denied));
      }

      var permission = await _checkAndRequestPermission();
      if (permission == LocationPermission.deniedForever) {
        isDeniedForever = true;
        emit(state.copyWith(status: PermissionStatus.deniedForever));
        return;
      } else if (permission == LocationPermission.denied) {
        emit(state.copyWith(status: PermissionStatus.denied));
        return;
      }

      final locationData = await Geolocator.getCurrentPosition();
      log('${locationData.latitude.toString()}, ${locationData.longitude.toString()}');
      final positionKey =
          await AccuWeatherAPI.getGeoPositionnKey(locationData.latitude, locationData.longitude);
      emit(state.copyWith(status: PermissionStatus.always, positionKey: positionKey));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: PermissionStatus.denied));
    }
  }

  Future<LocationPermission> _checkAndRequestPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return await Geolocator.requestPermission();
    }
    return permission;
  }
}
