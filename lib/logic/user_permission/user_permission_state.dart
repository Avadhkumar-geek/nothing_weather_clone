part of 'user_permission_cubit.dart';

enum PermissionStatus {
  always,
  denied,
  deniedForever,
  whileInUse,
  unableToDetermine
}

class UserPermissionState extends Equatable {
  final PermissionStatus status;
  final int? positionKey;

  const UserPermissionState({
    this.status = PermissionStatus.unableToDetermine,
    this.positionKey,
  });

  UserPermissionState copywith({PermissionStatus? status, int? positionKey}) =>
      UserPermissionState(
          status: status ?? this.status,
          positionKey: positionKey ?? this.positionKey);

  factory UserPermissionState.fromJson(Map<String, dynamic> json) {
    return UserPermissionState(
        status: json['status'], positionKey: json['positionKey']);
  }

  UserPermissionState toMap() {
    return UserPermissionState(status: status, positionKey: positionKey);
  }

  @override
  List<Object?> get props => [status, positionKey];
}
