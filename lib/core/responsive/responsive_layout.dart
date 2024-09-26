import 'package:flutter/material.dart';

class ResponsiveLayout {
  static const double baseWidth = 375.0;
  static const double baseHeight = 812.0;

  static double getWidth(double width, BuildContext context) {
    final double screenWidth = context.screenWidth();
    return width / baseWidth * screenWidth;
  }

  static double getHeight(double height, BuildContext context) {
    final double screenHeight = context.screenHeight();
    return height / baseHeight * screenHeight;
  }

  static double getFontSize(double fontSize, BuildContext context) {
    final double screenWidth = context.screenWidth();
    if (context.isiPad()) {
      double scaleFactor = screenWidth / baseWidth;
      return fontSize * scaleFactor;
    }
    return screenWidth / 100 * (fontSize / 3);
  }
}

extension ResponsiveNum on num {
  double w(BuildContext context) {
    return ResponsiveLayout.getWidth(toDouble(), context);
  }

  double h(BuildContext context) {
    return ResponsiveLayout.getHeight(toDouble(), context);
  }

  double sp(BuildContext context) {
    return ResponsiveLayout.getFontSize(toDouble(), context);
  }
}

extension ResponsiveContext on BuildContext {
  double screenHeight() {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.orientation == Orientation.portrait
        ? mediaQuery.size.height
        : mediaQuery.size.width;
  }

  double screenWidth() {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.orientation == Orientation.portrait
        ? mediaQuery.size.width
        : mediaQuery.size.height;
  }

  int getGridCrossAxisCount() {
    return isiPad() ? 3 : 2;
  }

  bool isiPad() {
    return screenWidth() > 600;
  }

  double calculateChildAspectRatio() {
    double referenceAspectRatio = 430 / 932;

    double currentAspectRatio = screenWidth() / screenHeight();

    double ratioDifference = currentAspectRatio / referenceAspectRatio;

    double childAspectRatio = (2 / 2.68) * ratioDifference;

    return isiPad() ? childAspectRatio / 2.3 : childAspectRatio;
  }
}
