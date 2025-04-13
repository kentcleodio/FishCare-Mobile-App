import 'package:flutter/material.dart';

const textColor = Colors.black;
const shadowColor = Colors.black;
const backgroundColor = Color.fromARGB(255, 240, 240, 240);
const primaryColor = Color.fromARGB(255, 100, 181, 246);
const primaryFgColor = Colors.white;
const secondaryColor = Color.fromARGB(255, 187, 222, 251);
const secondaryFgColor = Colors.black;
const accentColor = Color.fromARGB(255, 185, 246, 202);
const accentFgColor = Colors.black;
const transparent = Color.fromARGB(0, 0, 0, 0);
const dangerColor = Colors.red;
var secondaryDangerColor = Colors.red[100];
const healthyColor = Colors.green;
const abdomenColor = Colors.red;
const skinColor = Colors.amber;
const eyesColor = Colors.blue;

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
