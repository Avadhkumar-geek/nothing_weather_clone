class LocationModel {
  String? key;
  String? localizedName;
  Country? country;
  Country? administrativeArea;

  LocationModel(
      {this.key, this.localizedName, this.country, this.administrativeArea});

  LocationModel.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    localizedName = json['LocalizedName'];
    country =
        json['Country'] != null ? Country.fromJson(json['Country']) : null;
    administrativeArea = json['AdministrativeArea'] != null
        ? Country.fromJson(json['AdministrativeArea'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Key'] = key;
    data['LocalizedName'] = localizedName;
    if (country != null) {
      data['Country'] = country!.toJson();
    }
    if (administrativeArea != null) {
      data['AdministrativeArea'] = administrativeArea!.toJson();
    }
    return data;
  }
}

class Country {
  String? iD;
  String? localizedName;

  Country({this.iD, this.localizedName});

  Country.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    localizedName = json['LocalizedName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['LocalizedName'] = localizedName;
    return data;
  }
}
