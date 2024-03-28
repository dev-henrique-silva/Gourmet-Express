import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/controllers/login_controller.dart';
import 'package:gourmetexpress/app/controllers/register_account_controller.dart';
import 'package:gourmetexpress/app/cubits/home/home_cubit.dart';
import 'package:gourmetexpress/app/cubits/login/login_cubit.dart';
import 'package:gourmetexpress/app/cubits/register_account/register_account_cubit.dart';
import 'package:gourmetexpress/app/services/firebase_auth/firebase_auth_service.dart';
import 'package:gourmetexpress/app/services/food_service/food_service.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(
      firebaseAuth: getIt<FirebaseAuth>(),
    ),
  );

  getIt.registerSingleton<FoodService>(
    FoodService(),
  );

  getIt.registerFactory<RegisterAccountController>(
    () => RegisterAccountController(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerFactory<LoginController>(
    () => LoginController(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerFactory(
    () => HomeController(
      foodService: getIt<FoodService>(),
    ),
  );

  getIt.registerFactory(
    () => LoginCubit(
      loginController: getIt<LoginController>(),
    ),
  );

  getIt.registerFactory(
    () => RegisterAccountCubit(
      registerController: getIt<RegisterAccountController>(),
    ),
  );

  getIt.registerFactory(
    () => HomeCubit(
      homeController: getIt<HomeController>(),
    ),
  );
}
