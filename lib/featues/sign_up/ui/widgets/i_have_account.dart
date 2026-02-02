import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:flutter/material.dart';

class IHaveAccount extends StatelessWidget {
  const IHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: 'I have an account? ',
          style: TextStyles.font14GrayRegular,
        ),
        TextSpan(
          text: 'Login',
          style: TextStyles.font14DarkBlueMedium
        )
      ]
    ));
  }
}