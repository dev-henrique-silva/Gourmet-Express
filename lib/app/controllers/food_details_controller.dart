import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/cart_item_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/i_cart_item_service.dart';
import 'package:gourmetexpress/app/services/local_storage_service/i_local_storage_service.dart';
import 'package:gourmetexpress/app/services/local_storage_service/local_storage_service.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class FoodDetailsController {
  final ICartItemService _cartItemService;
  final ILocalStorageService _localStorageService;

  FoodDetailsController({
    required CartItemService cartItemService,
    required LocalStorageService localStorageService,
  })  : _cartItemService = cartItemService,
        _localStorageService = localStorageService;

  late final String uid;

  Future<void> getUidFromLocalStorage() async {
    uid = await _localStorageService.getUidFromLocalStorage() ??
        AppString.textVazio.texto;
  }

  Future<void> postCartItem({
    required FoodModel food,
    required List<AddonModel?> selectedAddons,
  }) async {
    await _cartItemService.postCartItem(
      uid,
      CartItemModel(
        food: food,
        selectedAddons: selectedAddons as List<AddonModel>,
        timestamp: Timestamp.now(),
      ),
    );
  }

  Stream<List<CartItemModel>> getACartItemStream({required String uid}) {
    return _cartItemService.getACartItemStream(uid);
  }

  Future<void> putCartItem({
    required String uid,
    required CartItemModel updatedCartItem,
  }) async {
    await _cartItemService.putCartItem(uid, updatedCartItem);
  }
}
