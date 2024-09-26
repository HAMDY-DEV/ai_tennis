import 'package:ai_tennis/core/function/show_error_dialogs.dart';
import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/core/util/colors.dart';
import 'package:ai_tennis/core/util/text_style.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ai_tennis/features/auth/presentation/manager/state/auth_state.dart';
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

  void _sign_up(BuildContext context) {
    AuthCubit().signUp(
        emailAddress: emailController.text,
        password: passwordController.text,
        name: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xff000d2d),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              showToast(msg: 'Success', context: context);
            } else if (state is SignUpError) {
              showToast(msg: 'Error', context: context);
            } else {
              showToast(msg: 'loding', context: context);
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.h(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(200.h(context)),
                  Text(
                    'SIGN UP',
                    style: getTitleStyle(context,
                        fontSize: 18.sp(context), color: AppColors.whiteColor),
                  ),
                  Gap(5.h(context)),
                  Text(
                    'CREATE AN ACCOUNT TO MAKE SDFSDF',
                    style: getBodyStyle(context,
                        fontSize: 14.sp(context), color: AppColors.whiteColor),
                  ),
                  Gap(50.h(context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Full Name',
                      style: getBodyStyle(context,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                  ),
                  Gap(10.h(context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: getBodyStyle(context,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                  ),
                  Gap(10.h(context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: getBodyStyle(context,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                  ),
                  Gap(10.h(context)),
                  CustomButton(
                    text: 'SIGN UP',
                    onTap: () {
                      _sign_up(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
