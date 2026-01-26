import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:advanced_flutter_course/featues/onboarding/widgets/doctor_image_and_name.dart';
import 'package:advanced_flutter_course/featues/onboarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical:20.h ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/svgs/logo_and_name_app.svg'),
              DoctorImageAndName(),
              Column(
                children: [
                  Text('Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.'
                  ,style: TextStyles.font13GraRegular ,),
                  SizedBox(height: 30.h,),
                  GetStartedButton(),
                ],
              )

            ],
          ),
        ),
      ),
    ),
    );
  }
} 