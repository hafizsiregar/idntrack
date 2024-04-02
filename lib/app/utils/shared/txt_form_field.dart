import 'package:flutter/material.dart';
import '../constants/color_constant.dart';

txtFormField(
    TextEditingController controller,
    String? Function(String?)? validator,
    String hintText,
    Icon prefixIcon,
    bool obscureText) {
  return Padding(
    padding: EdgeInsets.only(top: 32),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: const Color(0xff666161),
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.light,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}
