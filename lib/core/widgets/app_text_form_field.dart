import 'package:advanced_flutter_course/core/theming/colors.dart';
import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  const AppTextFormField({super.key, required this.hintText, this.suffixIcon, this.obscureText, this.controller, this.contentPadding, this.backgroundColor, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding??EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: suffixIcon==null? 15.h:10.h
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: BorderSide(color: ColorsManager.lightGray, width: 1.3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: BorderSide(color: Colors.red, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: BorderSide(color: Colors.red, width: 1.3),
        ),
        hintText: hintText,
        hintStyle: TextStyles.font14GrayRegular,
        fillColor: backgroundColor??ColorsManager.morelightGray,
        filled: true,
        suffixIcon: suffixIcon,

      ),
      obscureText: obscureText??false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}