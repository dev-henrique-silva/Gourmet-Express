import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:gourmetexpress/app/controllers/cart_controller.dart';
import 'package:gourmetexpress/app/controllers/food_details_controller.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/controllers/login_controller.dart';
import 'package:gourmetexpress/app/controllers/payment_controller.dart';
import 'package:gourmetexpress/app/controllers/register_account_controller.dart';
import 'package:gourmetexpress/app/cubits/home/home_cubit.dart';
import 'package:gourmetexpress/app/cubits/login/login_cubit.dart';
import 'package:gourmetexpress/app/cubits/register_account/register_account_cubit.dart';
import 'package:gourmetexpress/app/services/database_service/cart_item_database/cart_item_database.dart';
import 'package:gourmetexpress/app/services/database_service/database_service.dart';
import 'package:gourmetexpress/app/services/firebase_auth/firebase_auth_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/address/address_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/cart_item_service.dart';
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

  getIt.registerSingleton<AddressService>(
    AddressService(),
  );

  getIt.registerSingleton<CartItemService>(
    CartItemService(),
  );

  getIt.registerSingleton<DatabaseService>(
    DatabaseService(),
  );

  getIt.registerSingleton<CartItemDatabase>(
    CartItemDatabase(
      databaseService: getIt<DatabaseService>(),
    ),
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
      firebaseAuthService: getIt<FirebaseAuthService>(),
      addressService: getIt<AddressService>(),
      cartItemService: getIt<CartItemService>(),
    ),
  );

  getIt.registerFactory(
    () => FoodDetailsController(
      cartItemService: getIt<CartItemService>(),
      cartItemDatabase: getIt<CartItemDatabase>(),
    ),
  );

  getIt.registerFactory(
    () => PaymentController(
      cartItemDatabase: getIt<CartItemDatabase>(),
    ),
  );

  getIt.registerFactory(
    () => CartController(
      cartItemService: getIt<CartItemService>(),
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
