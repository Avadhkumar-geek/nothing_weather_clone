import 'package:flutter/material.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';

class RoundedWidget extends StatelessWidget {
  const RoundedWidget({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.txtSize1,
    required this.txtWeight1,
    required this.txtSize2,
    required this.txtWeight2,
  });

  final String txt1;
  final double txtSize1;
  final FontWeight txtWeight1;
  final String txt2;
  final double txtSize2;
  final FontWeight txtWeight2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
              text: txt1,
              style: TextStyle(
                fontSize: txtSize1,
                color: Colors.white,
                fontWeight: txtWeight1,
                height: 1.2,
              ),
              children: [
                TextSpan(
                  text: "\n$txt2",
                  style: TextStyle(
                    fontSize: txtSize2,
                    color: Colors.white,
                    fontWeight: txtWeight2,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
