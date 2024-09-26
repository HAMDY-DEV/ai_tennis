import 'package:ai_tennis/core/function/routing.dart';
import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/core/util/assets_images.dart';
import 'package:ai_tennis/core/util/colors.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/features/auth/presentation/screens/registration_screen.dart';
import 'package:flutter/material.dart';

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
      navigatorToReplacement(context, const RegistrationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesTennis,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primaryColor.withOpacity(0.1),
                      AppColors.primaryColor.withOpacity(0.9),
                      AppColors.primaryColor,
                      AppColors.primaryColor,
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: 20,
              right: 10,
              child: CustomButton(
                  text: 'skip', width: 150.w(context), onTap: () {})),
        ],
      ),
    );
  }
}
