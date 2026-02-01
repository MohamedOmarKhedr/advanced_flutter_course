import 'package:advanced_flutter_course/core/helper/app_regex.dart';
import 'package:advanced_flutter_course/core/helper/spaces_helper.dart';
import 'package:advanced_flutter_course/core/widgets/app_button.dart';
import 'package:advanced_flutter_course/core/widgets/app_text_form_field.dart';
import 'package:advanced_flutter_course/featues/login/ui/widgets/password_validations.dart';
import 'package:advanced_flutter_course/featues/sign_up/data/models/sign_up_request_body.dart';
import 'package:advanced_flutter_course/featues/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_flutter_course/featues/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final SignUpCubit _signUpCubit;

  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharachers = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    _signUpCubit = context.read<SignUpCubit>();

    setupPasswordValidationsListener();
    super.initState();
  }

  void setupPasswordValidationsListener() {
    _signUpCubit.passwordController.addListener(() {
      final password = _signUpCubit.passwordController.text;
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
    return SignUpBlocListener(
      child: Form(
        key: _signUpCubit.formkey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'name',
              controller: _signUpCubit.nameController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return 'please enter a valid name';
                } else {
                  return null;
                }
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'phone',
              controller: _signUpCubit.phoneController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return 'please enter a valid phone';
                } else {
                  return null;
                }
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'email',
              controller: _signUpCubit.emailController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'please enter a valid email';
                } else {
                  return null;
                }
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'gender',
              controller: _signUpCubit.genderController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return 'please enter a valid gender';
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
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'please enter your valid password';
                } else {
                  return null;
                }
              },
              controller: _signUpCubit.passwordController,
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'password confirmation',
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
                if (_signUpCubit.passwordController.text !=
                    _signUpCubit.passwordConfirmationController.text) {
                  return 'please enter your valid password confirmation';
                } else {
                  return null;
                }
              },
              controller: _signUpCubit.passwordConfirmationController,
            ),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharachers: hasSpecialCharachers,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
            verticalSpace(30),
            AppButton(
              text: 'Sign Up',
              onPressed: () {
                validateThenDoLogin(_signUpCubit);
              },
            ),
          ],
        ),
      ),
    );
  }
}

void validateThenDoLogin(SignUpCubit signUpCubit) {
  if (signUpCubit.formkey.currentState!.validate()) {
    signUpCubit.emitLoginStates(
      SignUpRequestBody(
        email: signUpCubit.emailController.text,
        password: signUpCubit.passwordConfirmationController.text,
        name: signUpCubit.nameController.text,
        phone: signUpCubit.phoneController.text,
        passwordConfirmation: signUpCubit.passwordConfirmationController.text,
        gender: signUpCubit.genderController.text == 'male' ? 1 : 2,
      ),
    );
  }
}
