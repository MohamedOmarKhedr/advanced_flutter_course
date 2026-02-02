import 'package:advanced_flutter_course/core/di/dependency_injection.dart';
import 'package:advanced_flutter_course/doc_app.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  runApp(const DocApp());
}



