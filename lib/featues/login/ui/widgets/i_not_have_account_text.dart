import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:flutter/material.dart';

class INotHaveAccountText extends StatelessWidget {
  const INotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: 'I don\'t have an account? ',
          style: TextStyles.font14GrayRegular,
        ),
        TextSpan(
          text: 'Sign Up',
          style: TextStyles.font14DarkBlueMedium
        )
      ]
    ));
  }
}