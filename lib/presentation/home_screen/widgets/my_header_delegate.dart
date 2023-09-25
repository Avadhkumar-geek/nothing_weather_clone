import 'package:flutter/material.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';
import 'package:nothing_weather_clone/data/models/forecast_model.dart';
import 'package:nothing_weather_clone/data/models/weather_model.dart';
import 'package:nothing_weather_clone/presentation/home_screen/widgets/rounded_widget.dart';

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final WeatherModel weather;
  final ForecastModel forecast;

  MyHeaderDelegate({required this.weather, required this.forecast});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kSecondaryColor,
      padding: const EdgeInsets.only(
        right: 24.0,
        left: 24,
        top: 5,
      ),
      child: Column(
        children: [
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.5,
              childAspectRatio: 1,
            ),
            children: [
              RoundedWidget(
                txt1: '${weather.temperature!.metric!.value!.round().toString()}°',
                txtSize1: 50,
                txtWeight1: FontWeight.w200,
                txt2:
                    'H:${forecast.dailyForecasts![0].temperature!.maximum!.value!.round().toString()}°  L:${forecast.dailyForecasts![0].temperature!.minimum!.value!.round().toString()}°',
                txtSize2: 13,
                txtWeight2: FontWeight.w300,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 18),
                    decoration: BoxDecoration(
                        color: kTertiaryColor, borderRadius: BorderRadius.circular(100)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AIR QUALITY  ${forecast.dailyForecasts![0].airAndPollen![0].categoryValue}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          forecast.dailyForecasts![0].airAndPollen![0].category!,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 18),
                    decoration: BoxDecoration(
                        color: kTertiaryColor, borderRadius: BorderRadius.circular(100)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UV INDEX  0${weather.uVIndex}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          weather.uVIndexText!,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            height: 2,
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 205.0; // Height of the second widget

  @override
  double get minExtent => 205.0; // Height of the second widget

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
