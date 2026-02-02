import 'package:advanced_flutter_course/core/networking/api_service.dart';
import 'package:advanced_flutter_course/core/networking/dio_factory.dart';
import 'package:advanced_flutter_course/featues/login/data/repo/login_repo.dart';
import 'package:advanced_flutter_course/featues/login/logic/login_cubit/login_cubit.dart';
import 'package:advanced_flutter_course/featues/sign_up/data/repos/sign_up_repo.dart';
import 'package:advanced_flutter_course/featues/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt () async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

}