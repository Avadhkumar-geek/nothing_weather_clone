class GeoPositionKeyModel {
  final String locationKey;

  const GeoPositionKeyModel({required this.locationKey});

  factory GeoPositionKeyModel.fromJson(Map<String, dynamic> json) {
    return GeoPositionKeyModel(
      locationKey: json['Key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Key': locationKey,
    };
  }
}
