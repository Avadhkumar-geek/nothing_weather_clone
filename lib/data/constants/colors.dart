import 'dart:ui';

const Color kPrimaryColor = Color.fromRGBO(27, 29, 31, 1.0);
const Color kSecondaryColor = Color.fromRGBO(215, 216, 216, 1);
const Color kErrorColor = Color.fromRGBO(215, 26, 33, 1.0);
const Color kTertiaryColor = Color.fromRGBO(231, 233, 233, 1.0);

DateTime epochToDateTime(int epoch) {
  final date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  return date;
}
