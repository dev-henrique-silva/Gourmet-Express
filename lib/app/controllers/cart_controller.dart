import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/cart_item_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/i_cart_item_service.dart';
import 'package:gourmetexpress/app/services/local_storage_service/i_local_storage_service.dart';
import 'package:gourmetexpress/app/services/local_storage_service/local_storage_service.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class CartController {
  final ICartItemService _cartItemService;
  final ILocalStorageService _localStorageService;

  CartController({
    required CartItemService cartItemService,
    required LocalStorageService localStorageService,
  })  : _cartItemService = cartItemService,
        _localStorageService = localStorageService;

  late final String uid;

  Future<void> getUidFromLocalStorage() async {
    uid = await _localStorageService.getUidFromLocalStorage() ??
        AppString.textVazio.texto;
  }

  Stream<List<CartItemModel>> getCartItemStream({required String uid}) {
    return _cartItemService.getCartItemStream(uid);
  }

  Future<void> putCartItem({
    required CartItemModel updatedCartItem,
  }) async {
    await _cartItemService.putCartItem(uid, updatedCartItem);
  }

  Future<void> deleteCartItemById({
    required String uid,
    required String itemId,
  }) async {
    await _cartItemService.deleteCartItemById(uid, itemId);
  }

  Future<void> deleteAllCartItems({required String uid}) async {
    await _cartItemService.deleteAllCartItems(uid);
  }

  double sumTotalValue(CartItemModel cartItem) {
    double foodPrice = cartItem.food.price;
    double addonPrice = 0.0;
    int quantity = cartItem.quantity;

    for (var addon in cartItem.selectedAddons) {
      addonPrice += addon.price;
    }

    cartItem.totalPrice = (foodPrice + addonPrice) * quantity;

    return cartItem.totalPrice;
  }

  double subtrationTotalValue(CartItemModel cartItem) {
    double foodPrice = cartItem.food.price;
    double addonPrice = 0.0;

    for (var addon in cartItem.selectedAddons) {
      addonPrice += addon.price;
    }

    double result = (cartItem.totalPrice - (foodPrice + addonPrice));
    cartItem.totalPrice = double.parse(result.toStringAsFixed(2));

    return cartItem.totalPrice;
  }
}
