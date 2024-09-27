import 'dart:developer';

import 'package:ai_tennis/core/function/routing.dart';
import 'package:ai_tennis/core/function/show_error_dialogs.dart';
import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/core/util/assets_images.dart';
import 'package:ai_tennis/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ai_tennis/features/auth/presentation/manager/state/auth_state.dart';
import 'package:ai_tennis/features/auth/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is SignUpSuccess) {
            showToast(msg: 'Done', context: context);
          } else if (state is SignUpError) {
            showToast(msg: 'Something went wrong', context: context);
          } else {
            showLottieDialog(
                context: context, lottieAsset: Assets.imagesAnimation);
          }
        }, builder: (context, state) {
          return Container(
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
                  bottom: 10.h(context),
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'CREATE AN ACCOUNT TO MAKE SDFSDF',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        Gap(15.h(context)),
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Gap(10.h(context)),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Gap(10.h(context)),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Gap(10.h(context)),
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().signUp(
                                emailAddress: emailController.text,
                                password: passwordController.text,
                                name: nameController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // لون زر "Sign In"
                            padding: const EdgeInsets.symmetric(
                                horizontal: 120, vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('SIGN UP',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                        Gap(10.h(context)),
                        TextButton(
                          onPressed: () {
                            navigatorTo(context, const LoginScreen());
                          },
                          child: const Text(
                            "HAVE AN ACCOUNT?",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
