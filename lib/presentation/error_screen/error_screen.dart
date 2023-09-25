import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 118),
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/error.svg',
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'LOCATION PERMISSION',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            decoration: BoxDecoration(
                color: kTertiaryColor,
                borderRadius: BorderRadius.circular(
                  100,
                )),
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kErrorColor,
                ),
                child: const Icon(
                  Icons.location_off_outlined,
                  color: kSecondaryColor,
                  weight: 0.1,
                  grade: 0.1,
                ),
              ),
              const SizedBox(width: 24),
              SizedBox(
                width: 200,
                child: Text.rich(
                  TextSpan(
                    text: 'LOCATION PERMISSION\n',
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Enable the location permission to get weather information in your current location.',
                        style: TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () => Geolocator.openLocationSettings(),
                          child: const Text(
                            'Edit premissions',
                            style: TextStyle(
                              fontSize: 12,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(
          'assets/svg/accuweather.svg',
          width: 100,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
