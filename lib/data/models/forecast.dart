// class ForecastModel {
//   ForecastModel({
//     required this.cod,
//     required this.message,
//     required this.cnt,
//     required this.list,
//   });
//   late final String cod;
//   late final int message;
//   late final int cnt;
//   late final List<FieldList> list;
//
//   ForecastModel.fromJson(Map<String, dynamic> json) {
//     cod = json['cod'];
//     message = json['message'];
//     cnt = json['cnt'];
//     list = List.from(json['list']).map((e) => FieldList.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['cod'] = cod;
//     data['message'] = message;
//     data['cnt'] = cnt;
//     data['list'] = list.map((e) => e.toJson()).toList();
//     return data;
//   }
// }
//
// class FieldList {
//   FieldList({
//     required this.dt,
//     required this.main,
//     required this.weather,
//     required this.dtTxt,
//   });
//   late final int dt;
//   late final Main main;
//   late final List<Weather> weather;
//   late final String dtTxt;
//
//   FieldList.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     main = Main.fromJson(json['main']);
//     weather =
//         List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
//     dtTxt = json['dt_txt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['dt'] = dt;
//     data['main'] = main.toJson();
//     data['weather'] = weather.map((e) => e.toJson()).toList();
//     data['dt_txt'] = dtTxt;
//     return data;
//   }
// }
//
// class Main {
//   Main({
//     required this.temp,
//     required this.feelsLike,
//     required this.tempMin,
//     required this.tempMax,
//     required this.tempKf,
//   });
//   late final double temp;
//   late final double? feelsLike;
//   late final double tempMin;
//   late final double tempMax;
//   late final double? tempKf;
//
//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     tempMin = json['temp_min'];
//     tempMax = json['temp_max'];
//     tempKf = json['temp_kf'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['temp'] = temp;
//     data['feels_like'] = feelsLike;
//     data['temp_min'] = tempMin;
//     data['temp_max'] = tempMax;
//     data['temp_kf'] = tempKf;
//     return data;
//   }
// }
//
// class Weather {
//   Weather({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });
//   late final int id;
//   late final String main;
//   late final String description;
//   late final String icon;
//
//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['main'] = main;
//     data['description'] = description;
//     data['icon'] = icon;
//     return data;
//   }
// }
//
// class Wind {
//   Wind({
//     required this.speed,
//     required this.deg,
//     required this.gust,
//   });
//   late final double? speed;
//   late final int deg;
//   late final double gust;
//
//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//     deg = json['deg'];
//     gust = json['gust'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['speed'] = speed;
//     data['deg'] = deg;
//     data['gust'] = gust;
//     return data;
//   }
// }
