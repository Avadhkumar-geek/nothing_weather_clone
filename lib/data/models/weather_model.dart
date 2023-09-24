class WeatherModel {
  String? localObservationDateTime;
  int? epochTime;
  String? weatherText;
  int? weatherIcon;
  bool? hasPrecipitation;
  bool? isDayTime;
  Temperature? temperature;
  Temperature? realFeelTemperature;
  int? relativeHumidity;
  Wind? wind;
  int? uVIndex;
  String? uVIndexText;

  WeatherModel({
    this.localObservationDateTime,
    this.epochTime,
    this.weatherText,
    this.weatherIcon,
    this.hasPrecipitation,
    this.isDayTime,
    this.temperature,
    this.realFeelTemperature,
    this.relativeHumidity,
    this.wind,
    this.uVIndex,
    this.uVIndexText,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    localObservationDateTime = json['LocalObservationDateTime'];
    epochTime = json['EpochTime'];
    weatherText = json['WeatherText'];
    weatherIcon = json['WeatherIcon'];
    hasPrecipitation = json['HasPrecipitation'];
    isDayTime = json['IsDayTime'];
    temperature = json['Temperature'] != null ? Temperature.fromJson(json['Temperature']) : null;
    realFeelTemperature = json['RealFeelTemperature'] != null
        ? Temperature.fromJson(json['RealFeelTemperature'])
        : null;
    relativeHumidity = json['RelativeHumidity'];
    wind = json['Wind'] != null ? Wind.fromJson(json['Wind']) : null;
    uVIndex = json['UVIndex'];
    uVIndexText = json['UVIndexText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LocalObservationDateTime'] = localObservationDateTime;
    data['EpochTime'] = epochTime;
    data['WeatherText'] = weatherText;
    data['WeatherIcon'] = weatherIcon;
    data['HasPrecipitation'] = hasPrecipitation;
    data['IsDayTime'] = isDayTime;
    if (temperature != null) {
      data['Temperature'] = temperature!.toJson();
    }
    if (realFeelTemperature != null) {
      data['RealFeelTemperature'] = realFeelTemperature!.toJson();
    }
    data['RelativeHumidity'] = relativeHumidity;
    if (wind != null) {
      data['Wind'] = wind!.toJson();
    }
    data['UVIndex'] = uVIndex;
    data['UVIndexText'] = uVIndexText;
    return data;
  }
}

class Temperature {
  Metric? metric;

  Temperature({this.metric});

  Temperature.fromJson(Map<String, dynamic> json) {
    metric = json['Metric'] != null ? Metric.fromJson(json['Metric']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metric != null) {
      data['Metric'] = metric!.toJson();
    }
    return data;
  }
}

class Metric {
  double? value;
  String? unit;
  int? unitType;
  String? phrase;

  Metric({this.value, this.unit, this.unitType, this.phrase});

  Metric.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    unit = json['Unit'];
    unitType = json['UnitType'];
    phrase = json['Phrase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Unit'] = unit;
    data['UnitType'] = unitType;
    data['Phrase'] = phrase;
    return data;
  }
}

class Wind {
  Direction? direction;
  Temperature? speed;

  Wind({this.direction, this.speed});

  Wind.fromJson(Map<String, dynamic> json) {
    direction = json['Direction'] != null ? Direction.fromJson(json['Direction']) : null;
    speed = json['Speed'] != null ? Temperature.fromJson(json['Speed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (direction != null) {
      data['Direction'] = direction!.toJson();
    }
    if (speed != null) {
      data['Speed'] = speed!.toJson();
    }
    return data;
  }
}

class Direction {
  int? degrees;
  String? localized;
  String? english;

  Direction({this.degrees, this.localized, this.english});

  Direction.fromJson(Map<String, dynamic> json) {
    degrees = json['Degrees'];
    localized = json['Localized'];
    english = json['English'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Degrees'] = degrees;
    data['Localized'] = localized;
    data['English'] = english;
    return data;
  }
}
