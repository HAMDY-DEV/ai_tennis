import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

showErrorDialogs({context, text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

showToast({required String msg, required BuildContext context}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.sp(context));
}

showLottieDialog({required context, required String lottieAsset}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Lottie.asset(lottieAsset),
        ),
      );
    },
  );
}
