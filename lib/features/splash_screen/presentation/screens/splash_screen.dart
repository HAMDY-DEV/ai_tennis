import 'package:ai_tennis/core/function/routing.dart';
import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/core/util/assets_images.dart';
import 'package:ai_tennis/core/util/colors.dart';
import 'package:ai_tennis/core/util/text_style.dart';
import 'package:ai_tennis/features/auth/presentation/screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      navigatorToReplacement(context, const Auth());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            Assets.imagesAnimation,
          ),
          Text(' Welcome to Tennis AI',
              style: getTitleStyle(context,
                  color: AppColors.whiteColor, fontSize: 20.sp(context))),
        ],
      ),
    );
  }
}
