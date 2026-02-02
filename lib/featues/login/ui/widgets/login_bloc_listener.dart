import 'package:advanced_flutter_course/core/helper/extensions/navigation_extension.dart';
import 'package:advanced_flutter_course/core/routing/routes.dart';
import 'package:advanced_flutter_course/core/theming/test_styles.dart';
import 'package:advanced_flutter_course/featues/login/logic/login_cubit/login_cubit.dart';
import 'package:advanced_flutter_course/featues/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  final Widget child;
  const LoginBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is Loading || current is Error || current is Success,
      child: child,
      listener: (BuildContext context, state) {
        state.whenOrNull(
          loading: (){

          },
          success: (loginResponse){
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error){
            setupErrorState(context, error);
          }
        );
      },
    );
  }
}

void setupErrorState (BuildContext context,String error){
  context.pop();
  showDialog(context: context, builder: (context)
  => AlertDialog(
    icon: Icon(Icons.error, color: Colors.red,size: 32,
    ),
    content: Text(
      error,style: TextStyles.font15DarkBlueSemiBold,
    ),
    actions: [
      Text('Got it',style: TextStyles.font14DarkBlueMedium,),
    ],
  ));
}
