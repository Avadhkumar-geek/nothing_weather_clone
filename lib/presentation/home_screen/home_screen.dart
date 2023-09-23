// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nothing_weather_clone/data/constants/colors.dart';
// import 'package:nothing_weather_clone/data/constants/svg_path.dart';
// import 'package:nothing_weather_clone/data/models/forecast_model.dart';
// import 'package:nothing_weather_clone/data/models/weather_model.dart';
// import 'package:nothing_weather_clone/logic/weather/weather_cubit.dart';
// import 'package:nothing_weather_clone/widgets/card.dart';
// import 'package:nothing_weather_clone/widgets/forecast_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<WeatherCubit>().fetchWeather(202441);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kSecondaryColor,
//       appBar: buildAppBar(),
//       body: SingleChildScrollView(
//         child: BlocBuilder<WeatherCubit, WeatherState>(
//           builder: (context, state) {
//             if (state.status == WeatherStatus.success) {
//               final weather = state.weather!;
//               final forecast = state.forecast!;

//               return buildWeatherScreen(weather, forecast);
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: kPrimaryColor,
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       surfaceTintColor: Colors.transparent,
//       title: const Text(
//         "SURAT",
//         style: TextStyle(fontSize: 15),
//       ),
//       backgroundColor: kSecondaryColor,
//       centerTitle: true,
//       leading: const Icon(Icons.menu_outlined),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 12.0),
//           child: IconButton(
//             onPressed: () {},
//             icon: SvgPicture.asset(
//               'assets/svg/settings.svg',
//               width: 22,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildWeatherScreen(WeatherModel weather, ForecastModel forecast) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Center(
//           child: Container(
//             margin: const EdgeInsets.symmetric(vertical: 118),
//             child: Column(
//               children: [
//                 Center(
//                   child: SvgPicture.asset(
//                     getSvgPath(weather.weatherText!.toLowerCase(),
//                         weather.isDayTime!)!,
//                     height: 200,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 Text(
//                   weather.weatherText!.toUpperCase(),
//                   style: const TextStyle(fontSize: 12),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(right: 24.0, left: 24, top: 5, bottom: 5),
//           child: GridView(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 15.5,
//               mainAxisSpacing: 18,
//               childAspectRatio: 1,
//             ),
//             children: [
//               RoundedWidget(
//                 txt1:
//                     '${weather.temperature!.metric!.value!.round().toString()}°',
//                 txtSize1: 50,
//                 txtWeight1: FontWeight.w200,
//                 txt2:
//                     'H:${forecast.dailyForecasts![0].temperature!.maximum!.value!.round().toString()}°  L:${forecast.dailyForecasts![0].temperature!.minimum!.value!.round().toString()}°',
//                 txtSize2: 13,
//                 txtWeight2: FontWeight.w300,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 21, horizontal: 18),
//                     decoration: BoxDecoration(
//                         color: kTertiaryColor,
//                         borderRadius: BorderRadius.circular(100)),
//                     child: const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "AIR QUALITY  44",
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Text(
//                           "Fair",
//                           style: TextStyle(
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 21, horizontal: 18),
//                     decoration: BoxDecoration(
//                         color: kTertiaryColor,
//                         borderRadius: BorderRadius.circular(100)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "UV INDEX  0${weather.uVIndex}",
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Text(
//                           weather.uVIndexText!,
//                           style: const TextStyle(
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         const Divider(
//           height: 2,
//           color: kPrimaryColor,
//           indent: 22,
//           endIndent: 22,
//         ),
//         const SizedBox(
//           height: 18,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 24.0, left: 24.0),
//           child: ForecastWidget(forecast: forecast),
//         ),
//         const SizedBox(
//           height: 18,
//         ),
//         buildCardsGrid(forecast, weather),
//         const SizedBox(
//           height: 50,
//         ),
//         SvgPicture.asset(
//           'assets/svg/accuweather.svg',
//           width: 100,
//         ),
//         const SizedBox(
//           height: 12,
//         )
//       ],
//     );
//   }

//   Widget buildCardsGrid(ForecastModel forecast, WeatherModel weather) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 24.0, left: 24.0),
//       child: GridView(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 18,
//           childAspectRatio: 0.991,
//         ),
//         children: [
//           MyCard(
//               image: 'assets/svg/air_quality.svg',
//               title: 'AIR QUALITY',
//               subTitle: forecast.dailyForecasts![0].airAndPollen![0].category,
//               data: forecast.dailyForecasts![0].airAndPollen![0].categoryValue
//                   .toString()),
//           MyCard(
//               image: 'assets/svg/humidity.svg',
//               title: 'HUMIDITY',
//               data: '${weather.relativeHumidity!}%'),
//           MyCard(
//               image: 'assets/svg/wind.svg',
//               title: 'WIND SPEED',
//               data: weather.wind!.speed!.metric!.value!.round().toString(),
//               windDegree: weather.wind!.direction!.degrees,
//               units: 'KM/H'),
//           MyCard(
//               image: 'assets/svg/uv_index.svg',
//               title: 'UV INDEX',
//               subTitle: weather.uVIndexText,
//               data: '0${weather.uVIndex.toString()}'),
//           MyCard(
//             image: weather.isDayTime!
//                 ? 'assets/svg/sunset.svg'
//                 : 'assets/svg/sunrise.svg',
//             title: weather.isDayTime! ? 'SUNSET' : 'SUNRISE',
//             data: (() {
//               if (weather.isDayTime!) {
//                 final date =
//                     epochToDateTime(forecast.dailyForecasts![0].sun!.epochSet!);
//                 return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
//               } else {
//                 final date = epochToDateTime(
//                     forecast.dailyForecasts![1].sun!.epochRise!);
//                 return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
//               }
//             }()),
//           ),
//           RoundedWidget(
//             txt1: 'FEELS LIKE',
//             txtSize1: 13,
//             txtWeight1: FontWeight.w300,
//             txt2:
//                 '${weather.realFeelTemperature!.metric!.value!.round().toString()}°',
//             txtSize2: 50,
//             txtWeight2: FontWeight.w200,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RoundedWidget extends StatelessWidget {
//   const RoundedWidget({
//     super.key,
//     required this.txt1,
//     required this.txt2,
//     required this.txtSize1,
//     required this.txtWeight1,
//     required this.txtSize2,
//     required this.txtWeight2,
//   });

//   final String txt1;
//   final double txtSize1;
//   final FontWeight txtWeight1;
//   final String txt2;
//   final double txtSize2;
//   final FontWeight txtWeight2;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       decoration: const BoxDecoration(
//         color: kPrimaryColor,
//         shape: BoxShape.circle,
//       ),
//       child: Center(
//         child: Text.rich(
//           textAlign: TextAlign.center,
//           TextSpan(
//               text: txt1,
//               style: TextStyle(
//                 fontSize: txtSize1,
//                 color: Colors.white,
//                 fontWeight: txtWeight1,
//                 height: 1.2,
//               ),
//               children: [
//                 TextSpan(
//                   text: "\n$txt2",
//                   style: TextStyle(
//                     fontSize: txtSize2,
//                     color: Colors.white,
//                     fontWeight: txtWeight2,
//                   ),
//                 )
//               ]),
//         ),
//       ),
//     );
//   }
// }
