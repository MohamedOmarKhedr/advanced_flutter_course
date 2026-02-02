import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: 'By logging, you agree to our ',
          style: TextStyles.font14GrayRegular,
        ),
        TextSpan(
          text: 'Terms & Conditions and PrivacyPolicy ',
          style: TextStyles.font14DarkBlueMedium
        ),
        TextSpan(
          text: 'and ',
          style: TextStyles.font14GrayRegular.copyWith(height: 1.3)
        ),
        TextSpan(
          text: 'PrivacyPolicy',
          style: TextStyles.font14DarkBlueMedium
        )
      ]
    ));
  }
}