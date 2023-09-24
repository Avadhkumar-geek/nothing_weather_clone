class ForecastModel {
  Headline? headline;
  List<DailyForecasts>? dailyForecasts;

  ForecastModel({this.headline, this.dailyForecasts});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    headline = json['Headline'] != null ? Headline.fromJson(json['Headline']) : null;
    if (json['DailyForecasts'] != null) {
      dailyForecasts = <DailyForecasts>[];
      json['DailyForecasts'].forEach((v) {
        dailyForecasts!.add(DailyForecasts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headline != null) {
      data['Headline'] = headline!.toJson();
    }
    if (dailyForecasts != null) {
      data['DailyForecasts'] = dailyForecasts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Headline {
  String? effectiveDate;
  int? effectiveEpochDate;
  int? severity;
  String? text;
  String? category;
  String? endDate;
  int? endEpochDate;

  Headline(
      {this.effectiveDate,
      this.effectiveEpochDate,
      this.severity,
      this.text,
      this.category,
      this.endDate,
      this.endEpochDate});

  Headline.fromJson(Map<String, dynamic> json) {
    effectiveDate = json['EffectiveDate'];
    effectiveEpochDate = json['EffectiveEpochDate'];
    severity = json['Severity'];
    text = json['Text'];
    category = json['Category'];
    endDate = json['EndDate'];
    endEpochDate = json['EndEpochDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['EffectiveDate'] = effectiveDate;
    data['EffectiveEpochDate'] = effectiveEpochDate;
    data['Severity'] = severity;
    data['Text'] = text;
    data['Category'] = category;
    data['EndDate'] = endDate;
    data['EndEpochDate'] = endEpochDate;
    return data;
  }
}

class DailyForecasts {
  String? date;
  int? epochDate;
  Sun? sun;
  Temperature? temperature;
  List<AirAndPollen>? airAndPollen;
  Day? day;
  String? mobileLink;

  DailyForecasts(
      {this.date,
      this.epochDate,
      this.sun,
      this.temperature,
      this.airAndPollen,
      this.day,
      this.mobileLink});

  DailyForecasts.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    epochDate = json['EpochDate'];
    sun = json['Sun'] != null ? Sun.fromJson(json['Sun']) : null;
    temperature = json['Temperature'] != null ? Temperature.fromJson(json['Temperature']) : null;
    if (json['AirAndPollen'] != null) {
      airAndPollen = <AirAndPollen>[];
      json['AirAndPollen'].forEach((v) {
        airAndPollen!.add(AirAndPollen.fromJson(v));
      });
    }
    day = json['Day'] != null ? Day.fromJson(json['Day']) : null;
    mobileLink = json['MobileLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    data['EpochDate'] = epochDate;
    if (sun != null) {
      data['Sun'] = sun!.toJson();
    }
    if (temperature != null) {
      data['Temperature'] = temperature!.toJson();
    }
    if (airAndPollen != null) {
      data['AirAndPollen'] = airAndPollen!.map((v) => v.toJson()).toList();
    }
    if (day != null) {
      data['Day'] = day!.toJson();
    }
    data['MobileLink'] = mobileLink;
    return data;
  }
}

class Sun {
  String? rise;
  int? epochRise;
  String? set;
  int? epochSet;

  Sun({this.rise, this.epochRise, this.set, this.epochSet});

  Sun.fromJson(Map<String, dynamic> json) {
    rise = json['Rise'];
    epochRise = json['EpochRise'];
    set = json['Set'];
    epochSet = json['EpochSet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Rise'] = rise;
    data['EpochRise'] = epochRise;
    data['Set'] = set;
    data['EpochSet'] = epochSet;
    return data;
  }
}

class Temperature {
  Minimum? minimum;
  Minimum? maximum;

  Temperature({this.minimum, this.maximum});

  Temperature.fromJson(Map<String, dynamic> json) {
    minimum = json['Minimum'] != null ? Minimum.fromJson(json['Minimum']) : null;
    maximum = json['Maximum'] != null ? Minimum.fromJson(json['Maximum']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (minimum != null) {
      data['Minimum'] = minimum!.toJson();
    }
    if (maximum != null) {
      data['Maximum'] = maximum!.toJson();
    }
    return data;
  }
}

class Minimum {
  double? value;
  String? unit;
  int? unitType;

  Minimum({this.value, this.unit, this.unitType});

  Minimum.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    unit = json['Unit'];
    unitType = json['UnitType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Unit'] = unit;
    data['UnitType'] = unitType;
    return data;
  }
}

class AirAndPollen {
  String? name;
  int? value;
  String? category;
  int? categoryValue;
  String? type;

  AirAndPollen({this.name, this.value, this.category, this.categoryValue, this.type});

  AirAndPollen.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    value = json['Value'];
    category = json['Category'];
    categoryValue = json['CategoryValue'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Value'] = value;
    data['Category'] = category;
    data['CategoryValue'] = categoryValue;
    data['Type'] = type;
    return data;
  }
}

class Day {
  int? icon;
  String? iconPhrase;
  bool? hasPrecipitation;
  String? precipitationType;

  Day({this.icon, this.iconPhrase, this.hasPrecipitation, this.precipitationType});

  Day.fromJson(Map<String, dynamic> json) {
    icon = json['Icon'];
    iconPhrase = json['IconPhrase'];
    hasPrecipitation = json['HasPrecipitation'];
    precipitationType = json['PrecipitationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Icon'] = icon;
    data['IconPhrase'] = iconPhrase;
    data['HasPrecipitation'] = hasPrecipitation;
    data['PrecipitationType'] = precipitationType;
    return data;
  }
}
