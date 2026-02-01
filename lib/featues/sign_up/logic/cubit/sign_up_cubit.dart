import 'package:advanced_flutter_course/core/networking/api_result.dart';
import 'package:advanced_flutter_course/featues/sign_up/data/models/sign_up_request_body.dart';
import 'package:advanced_flutter_course/featues/sign_up/data/repos/sign_up_repo.dart';
import 'package:advanced_flutter_course/featues/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());

  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();


  void emitLoginStates(SignUpRequestBody signUpRequestBody) async {
    emit(SignUpState.loading());
    final response = await _signUpRepo.signUp(signUpRequestBody);

    response.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(
          SignUpState.error(
            error: error.apiErrorModel.message ?? 'something went wrong',
          ),
        );
      },
    );
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    nameController.dispose();
    phoneController.dispose();
    genderController.dispose();
    return super.close();
  }
}
