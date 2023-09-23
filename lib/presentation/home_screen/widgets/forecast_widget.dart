import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';
import 'package:nothing_weather_clone/data/constants/constants.dart';
import 'package:nothing_weather_clone/data/constants/svg_path.dart';
import 'package:nothing_weather_clone/data/models/forecast_model.dart';

class ForecastWidget extends StatelessWidget {
  final ForecastModel forecast;
  const ForecastWidget({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kTertiaryColor,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: forecast.dailyForecasts!.length,
        separatorBuilder: (context, index) => const SizedBox(width: 37),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 39,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  epochToDateTime(forecast.dailyForecasts![index].epochDate!)
                              .day ==
                          DateTime.now().day
                      ? days[0]!
                      : days[epochToDateTime(
                              forecast.dailyForecasts![index].epochDate!)
                          .weekday]!,
                  style: const TextStyle(fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: SvgPicture.asset(
                    getSvgPath(
                        forecast.dailyForecasts![index].day!.iconPhrase!
                            .toLowerCase(),
                        true)!,
                    height: 16,
                  ),
                ),
                Text(
                  '${forecast.dailyForecasts![index].temperature!.maximum!.value!.round()}°',
                  style: const TextStyle(fontSize: 13),
                ),
                Text(
                  '${forecast.dailyForecasts![index].temperature!.minimum!.value!.round()}°',
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
