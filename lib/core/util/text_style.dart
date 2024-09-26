import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle getTitleStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    //  fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: fontSize ?? 18.sp(context),
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? modeTheme,
    fontFamily: fontFamily ?? GoogleFonts.poppins().fontFamily,
  );
}

TextStyle getBodyStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    fontSize: fontSize ?? 16.sp(context),
    // fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? modeTheme,
    fontFamily: fontFamily ?? GoogleFonts.poppins().fontFamily,
  );
}

TextStyle getDecorationStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
  Color? decorationColor,
  double? decorationThickness,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    decoration: TextDecoration.underline,
    decorationColor:
        decorationColor ?? AppColors.greyColor, // لون الخط تحت النص
    decorationThickness: decorationThickness ?? 2, // سمك الخط تحت النص
    fontSize: fontSize ?? 16.sp(context),
    // fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? modeTheme,
    fontFamily: fontFamily ?? GoogleFonts.poppins().fontFamily,
  );
}

TextStyle getSmallStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    // fontFamily: GoogleFonts.poppins().fontFamily,

    fontSize: fontSize ?? 14.sp(context),
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? modeTheme,
    fontFamily: fontFamily ?? GoogleFonts.poppins().fontFamily,
  );
}
