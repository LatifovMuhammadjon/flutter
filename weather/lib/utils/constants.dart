import 'package:flutter/material.dart';

const String currencyBox = 'currency_box';
const String weatherBox = 'weather_box';
const String weeklyBox = 'weekly_box';
const String currencyListKey = 'currency_list_key';
const String dateBox = 'date_box';
const String dateKey = 'date_key';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    Key? key,
    required this.gradient,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

const scaffoldWeatherGradient =
    LinearGradient(colors: [Color(0xffFEF7FF), Color(0xffFCEBFF)]);
const textWeatherGradient = LinearGradient(
    colors: [Color(0xffFFFFFF), Color(0xffD2C4FF)],
    transform: GradientRotation(45));
const containerWeatherGradient = LinearGradient(
    colors: [Color(0xffE662E5), Color(0xff5364F0)],
    transform: GradientRotation(45));

TextStyle kTextStyle(
    {Color? color,
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    double? height}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

List<String> locations = [
  "tashkent",
  "andijan",
  "bukhara",
  "gulistan",
  "jizzakh",
  "zarafshan",
  "karshi",
  "navoi",
  "namangan",
  "nukus",
  "samarkand",
  "termez",
  "urgench",
  "ferghana",
  "khiva"
];
