import 'package:advanced_flutter_course/core/helper/spaces_helper.dart';
import 'package:advanced_flutter_course/core/theming/colors.dart';
import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharachers;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasSpecialCharachers, required this.hasNumber, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least has 1 lower case letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least has 1 upper case letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At least has 1 special character', hasSpecialCharachers),
        verticalSpace(2),
        buildValidationRow('At least has 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least has 8 characters', hasMinLength),
        verticalSpace(2)
      ],
    );
  }
  
  Widget buildValidationRow(String text, bool isValid) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: isValid ? ColorsManager.darkBlue : ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(text, style: TextStyles.font14GrayRegular.copyWith(
          color: isValid ? ColorsManager.gray : ColorsManager.darkBlue,
          decoration: isValid?TextDecoration.lineThrough:TextDecoration.none,
        decorationColor: Colors.green,
        decorationThickness: 2
        ),),
      ],
    );
  }
}