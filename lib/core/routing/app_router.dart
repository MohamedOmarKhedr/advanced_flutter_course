import 'package:advanced_flutter_course/core/di/dependency_injection.dart';
import 'package:advanced_flutter_course/core/routing/routes.dart';
import 'package:advanced_flutter_course/featues/home/ui/home_screen.dart';
import 'package:advanced_flutter_course/featues/login/logic/login_cubit/login_cubit.dart';
import 'package:advanced_flutter_course/featues/login/ui/login_screen.dart';
import 'package:advanced_flutter_course/featues/onboarding/onboarding_screen.dart';
import 'package:advanced_flutter_course/featues/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_flutter_course/featues/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());  
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
