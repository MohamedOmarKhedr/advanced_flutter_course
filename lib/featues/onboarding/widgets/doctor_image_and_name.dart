import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndName extends StatelessWidget {
  const DoctorImageAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/logo_with_low_opicity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white.withValues(alpha: 0.0),
              ],
            ),
          ),
          child: Image.asset('assets/images/Image.png'),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child:Text(
            'Best Doctor Appointment App',
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.4
            )
          ))

      ],
    );
  }
}