import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Colors.blue[900]!;
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color greyColor = Colors.grey;
  static Color redColor = Colors.red;

  static Gradient gradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff000221),
      Color(0xff0C2057),
      Color(0xff133176),
    ], // You can use any colors you like
  );
}
