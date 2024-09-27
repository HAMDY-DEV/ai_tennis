import 'package:ai_tennis/core/function/routing.dart';
import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/core/util/assets_images.dart';
import 'package:ai_tennis/features/auth/presentation/screens/login.dart';
import 'package:ai_tennis/features/auth/presentation/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // الجزء العلوي الأبيض المنحني
            Positioned(
              top: -350.h(context),
              left: -150.w(context),
              right: -150.w(context),
              child: Container(
                height: 800.h(context),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  Assets.imagesTennisLogo,
                  height: 250.h(context),
                  width: 250.h(context),
                ),
              ),
            ),

            Positioned(
              bottom: 150.h(context),
              right: 0,
              left: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(100.h(context)),
                  // زر "Sign In"
                  ElevatedButton(
                    onPressed: () {
                      navigatorTo(context, const LoginScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // لون زر "Sign In"
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Log In',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),

                  const SizedBox(height: 20),

                  // زر "Log In"
                  OutlinedButton(
                    onPressed: () {
                      navigatorTo(context, const RegistrationScreen());
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 18),
                      side: const BorderSide(
                          color: Colors.white, width: 2), // إطار الزر
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Sign In',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
