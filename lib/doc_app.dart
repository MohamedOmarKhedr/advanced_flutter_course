import 'package:advanced_flutter_course/core/routing/app_router.dart';
import 'package:advanced_flutter_course/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // التغيير هنا: نستخدم builder لبناء التطبيق
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Advanced Flutter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: Routes.onboardingScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}