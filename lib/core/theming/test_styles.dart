import 'package:advanced_flutter_course/core/theming/colors.dart';
import 'package:flutter/material.dart';

class TextStyles{
  static TextStyle font24Black700Weight = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle font32BlueBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );
  static TextStyle font13GraRegular = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: ColorsManager.gray,
  );
  static TextStyle font16whiteSemiBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  

}