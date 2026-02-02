import 'package:advanced_flutter_course/core/helper/app_regex.dart';
import 'package:advanced_flutter_course/core/helper/spaces_helper.dart';
import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:advanced_flutter_course/core/widgets/app_button.dart';
import 'package:advanced_flutter_course/core/widgets/app_text_form_field.dart';
import 'package:advanced_flutter_course/featues/login/data/model/login_request_body.dart';
import 'package:advanced_flutter_course/featues/login/logic/login_cubit/login_cubit.dart';
import 'package:advanced_flutter_course/featues/login/ui/widgets/login_bloc_listener.dart';
import 'package:advanced_flutter_course/featues/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginCubit _loginCubit;

  bool isObscureText = true;
  bool isRememberMe = false;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharachers = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    _loginCubit = context.read<LoginCubit>();

    setupPasswordValidationsListener();
    super.initState();
  }

  void setupPasswordValidationsListener() {
    _loginCubit.passwordController.addListener(() {
      final password = _loginCubit.passwordController.text;
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(password);
        hasUpperCase = AppRegex.hasUpperCase(password);
        hasSpecialCharachers = AppRegex.hasSpecialCharacter(password);
        hasNumber = AppRegex.hasNumber(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    
      });
  }

  @override
  Widget build(BuildContext context) {
    return LoginBlocListener(
      child: Form(
        key: _loginCubit.formkey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'email',
              controller: _loginCubit.emailController,
              validator: (value) {
                if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                  return 'please enter a valid email';
                } else {
                  return null;
                }
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'password',
              obscureText: isObscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                icon: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                  return 'please enter your valid password';
                } else {
                  return null;
                }
              },
              controller: _loginCubit.passwordController,
            ),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharachers: hasSpecialCharachers,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
            verticalSpace(8),
            Row(
              children: [
                Checkbox(
                  value: isRememberMe,
                  onChanged: (value) {
                    setState(() {
                      isRememberMe = value!;
                    });
                  },
                ),
                Text('Remember Me', style: TextStyles.font14GrayRegular),
                Spacer(),
                Text(
                  'Forgot Password?',
                  style: TextStyles.font14DarkBlueMedium,
                ),
              ],
            ),
            verticalSpace(30),
            AppButton(
              text: 'Login',
              onPressed: () {
                validateThenDoLogin(_loginCubit);
              },
            ),
          ],
        ),
      ),
    );
  }

}

void validateThenDoLogin(LoginCubit loginCubit) {
  if (loginCubit.formkey.currentState!.validate()) {
    loginCubit.emitLoginStates(
      LoginRequestBody(
        email: loginCubit.emailController.text,
        password: loginCubit.passwordController.text,
      ),
    );
  }
}
