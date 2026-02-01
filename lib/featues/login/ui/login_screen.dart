import 'package:advanced_flutter_course/core/helper/spaces_helper.dart';
import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:advanced_flutter_course/featues/login/ui/widgets/i_not_have_account_text.dart';
import 'package:advanced_flutter_course/featues/login/ui/widgets/login_form.dart';
import 'package:advanced_flutter_course/featues/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isRememberMe = false;
  
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
                  LoginForm(),
                  verticalSpace(16),
                  TermsAndConditionsText(),
                  verticalSpace(30),
                  INotHaveAccountText()
                  
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
