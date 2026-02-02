import 'package:advanced_flutter_course/core/helper/extensions/navigation_extension.dart';
import 'package:advanced_flutter_course/core/helper/spaces_helper.dart';
import 'package:advanced_flutter_course/core/routing/routes.dart';
import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:advanced_flutter_course/featues/sign_up/ui/widgets/i_have_account.dart';
import 'package:advanced_flutter_course/featues/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 30.w),
          child: Column(
            children: [
              Text('Welcome Back',style: TextStyles.font24blueBold,),
              verticalSpace(8),
              Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36),
              Column(
                children: [
                  SignUpForm(),
                  verticalSpace(30),
                  GestureDetector(
                    onTap: (){
                      context.pushNamed(Routes.loginScreen);
                    },
                    child: IHaveAccount())
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
