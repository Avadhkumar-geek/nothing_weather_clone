import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';

class MyCard extends StatelessWidget {
  final String image;
  final String title;
  final String? subTitle;
  final String data;
  final String? units;
  final int? windDegree;

  const MyCard(
      {super.key,
      required this.image,
      required this.title,
      this.subTitle,
      required this.data,
      this.units,
      this.windDegree});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      decoration: BoxDecoration(
        color: kTertiaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
                Text(
                  subTitle ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  image,
                  width: 180,
                  fit: BoxFit.cover,
                ),
                title == 'HUMIDITY'
                    ? SvgPicture.asset(
                        'assets/svg/humidity_fill.svg',
                        width: (int.parse(data.substring(0, 2)) * 92) / 100,
                        // fit: BoxFit.cover,
                      )
                    : title == 'WIND SPEED'
                        ? Transform.rotate(
                            angle: (windDegree! * math.pi) / 180,
                            child: SvgPicture.asset(
                              'assets/svg/wind_arrow.svg',
                              width: 180,
                            ),
                          )
                        : const SizedBox()
              ],
            ),
            Text.rich(
              TextSpan(
                  text: data,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w400, height: 1),
                  children: [
                    TextSpan(
                      text: units,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400, height: 1),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
