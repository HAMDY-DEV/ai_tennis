import 'package:ai_tennis/core/util/colors.dart';
import 'package:ai_tennis/core/util/text_style.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key,
    required this.labelText, required TextEditingController controller, this.validator,
  });
  final String labelText;
  final TextEditingController controller = TextEditingController();
    final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: getSmallStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
            TextDecoration.none,
            fontSize: 20),
        filled: true,
        fillColor: AppColors.whiteColor.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
