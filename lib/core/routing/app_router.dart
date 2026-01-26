import 'package:advanced_flutter_course/core/routing/routes.dart';
import 'package:advanced_flutter_course/featues/login/ui/login_screen.dart';
import 'package:advanced_flutter_course/featues/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route <dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
    
}