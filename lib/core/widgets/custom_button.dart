import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/core/util/colors.dart';
import 'package:ai_tennis/core/util/text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.style,
    this.borderColor,
    this.borderWidth,
    this.color,
    this.textColor,
    this.borderRadius,
    this.boxShadowColor,
    required this.text,
  });
  TextStyle? style;
  final double? height;
  final double? width;
  final double? borderWidth;

  final String text;
  final Color? color;
  final Color? boxShadowColor;
  final Color? borderColor;
  final Color? textColor;
  void Function()? onTap;
  double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 250.w(context),
        height: height ?? 50.h(context),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: boxShadowColor ?? AppColors.blackColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: style ??
                getTitleStyle(context,
                    color: textColor ?? AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
