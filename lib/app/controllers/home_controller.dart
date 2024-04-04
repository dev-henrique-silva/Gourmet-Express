import 'package:gourmetexpress/app/models/address_model.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';
import 'package:gourmetexpress/app/services/firebase_auth/i_firebase_auth_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/address/i_address_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/i_cart_item_service.dart';
import 'package:gourmetexpress/app/services/food_service/i_food_service.dart';

class HomeController {
  final IFoodService _foodService;
  final IFirebaseAuthService _firebaseAuthService;
  final IAddressService _addressService;
  final ICartItemService _cartItemService;

  HomeController({
    required IFoodService foodService,
    required IFirebaseAuthService firebaseAuthService,
    required IAddressService addressService,
    required ICartItemService cartItemService,
  })  : _foodService = foodService,
        _firebaseAuthService = firebaseAuthService,
        _addressService = addressService,
        _cartItemService = cartItemService;

  Future<void> postAddress({
    required String uid,
    required AddressModel address,
  }) async {
    await _addressService.postAddress(uid, address);
  }

  Stream<AddressModel> getAddress({required String uid}) {
    return _addressService.getAddressStream(uid);
  }

  Future<void> putAddress({
    required String uid,
    required AddressModel address,
  }) async {
    await _addressService.putAddress(uid, address);
  }

  Future<List<FoodModel>> getBurgers() async {
    return await _foodService.getBurgers();
  }

  Future<List<FoodModel>> getSalads() async {
    return await _foodService.getSalads();
  }

  Future<List<FoodModel>> getDesserts() async {
    return await _foodService.getDesserts();
  }

  Future<List<FoodModel>> getDrinks() async {
    return await _foodService.getDrinks();
  }

  Stream<List<CartItemModel>> getCartItemStream({required String uid}) {
    return _cartItemService.getCartItemStream(uid);
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }
}
