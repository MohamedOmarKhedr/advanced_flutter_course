import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,
    
    style: TextButton.styleFrom(
      minimumSize: Size(double.infinity, 50.h),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
     child: Text(text,style: TextStyles.font16whiteSemiBold,));
  }
}