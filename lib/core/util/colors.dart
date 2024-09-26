import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xff014bb4);
  static Color SecondColor = const Color(0xff79C143);
  static Color turquoiseColor = const Color(0xff067FAD);
  static Color FooterColor = const Color(0xffCEE2ED); //
  static Color pageColor = const Color(0xffF1F4F8); //
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
