import 'package:flutter/material.dart';
import 'color_const.dart';

const String fontName = 'Roboto';
const hintAndValueStyle = TextStyle(
    color: Color(0xff353535),
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
    fontFamily: fontName);

const textTheme = TextTheme(
  headline4: display1,
  headline5: headline,
  headline6: title,
  subtitle2: subtitle,
  bodyText2: body2,
  bodyText1: body1,
  caption: caption,
);

const display1 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 36,
  letterSpacing: 0.4,
  height: 0.9,
  color: DARK_COLOR,
);

const headline = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 24,
  letterSpacing: 0.27,
  color: DARK_COLOR,
);

const title = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 16,
  letterSpacing: 0.18,
  color: DARK_COLOR,
);

const subtitle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: -0.04,
  color: DARK_COLOR,
);

const body2 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 0.2,
  color: DARK_COLOR,
);

const body1 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: -0.05,
  color: DARK_COLOR,
);

const caption = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 0.2,
  color: LIGHT_COLOR, // was lightText
);
