import 'package:gourmetexpress/app/models/address_model.dart';
import 'package:gourmetexpress/app/models/food.dart';
import 'package:gourmetexpress/app/services/firebase_auth/i_firebase_auth_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/address/address_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/address/i_address_service.dart';
import 'package:gourmetexpress/app/services/food_service/i_food_service.dart';
import 'package:gourmetexpress/app/services/local_storage_service/i_local_storage_service.dart';
import 'package:gourmetexpress/app/services/local_storage_service/local_storage_service.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class HomeController {
  final IFoodService _foodService;
  final IFirebaseAuthService _firebaseAuthService;
  final IAddressService _addressService;
  final ILocalStorageService _localStorageService;

  HomeController(
      {required IFoodService foodService,
      required IFirebaseAuthService firebaseAuthService,
      required AddressService addressService,
      required LocalStorageService localStorageService})
      : _foodService = foodService,
        _firebaseAuthService = firebaseAuthService,
        _addressService = addressService,
        _localStorageService = localStorageService;

  late final String uid;

  Future<void> getUidFromLocalStorage() async {
    uid = await _localStorageService.getUidFromLocalStorage() ??
        AppString.textVazio.texto;
  }

  Future<void> postAddress(AddressModel address) async {
    await _addressService.postAddress(uid, address);
  }

  Stream<AddressModel> getAddress() {
    return _addressService.getAddressStream(uid);
  }

  Future<void> putAddress(AddressModel address) async {
    await _addressService.putAddress(uid, address);
  }

  Future<List<Food>> getBurgers() async {
    return await _foodService.getBurgers();
  }

  Future<List<Food>> getSalads() async {
    return await _foodService.getSalads();
  }

  Future<List<Food>> getDesserts() async {
    return await _foodService.getDesserts();
  }

  Future<List<Food>> getDrinks() async {
    return await _foodService.getDrinks();
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }

  Future<void> clear() async {
    await _localStorageService.clear();
  }
}
