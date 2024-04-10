import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';
import 'package:gourmetexpress/app/services/database_service/cart_item_database/cart_item_database.dart';
import 'package:gourmetexpress/app/services/database_service/cart_item_database/i_cart_item_database.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/cart_item_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/i_cart_item_service.dart';

class CartController {
  final ICartItemService _cartItemService;
  final ICartItemDatabase _cartItemDatabase;

  CartController({
    required CartItemService cartItemService,
    required CartItemDatabase cartItemDatabase,
  })  : _cartItemService = cartItemService,
        _cartItemDatabase = cartItemDatabase;

  Stream<List<CartItemModel>> getCartItemStream({required String uid}) {
    return _cartItemService.getCartItemStream(uid);
  }

  Future<void> putCartItem({
    required String uid,
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

  Future<void> insertDatabase({
    required FoodModel food,
    int? quantity,
    required List<AddonModel> selectedAddons,
  }) async {
    await _cartItemDatabase.insert(
      CartItemModel(
        food: food,
        quantity: quantity ?? 1,
        selectedAddons: selectedAddons,
        totalPrice: _calculateTotalPrice(food.price, selectedAddons),
      ).toMapSqlfiteDatabase(),
    );
  }

  double _calculateTotalPrice(
      double foodPrice, List<AddonModel?> selectedAddons) {
    double addonPrice = 0.0;

    for (var addon in selectedAddons) {
      addonPrice += addon!.price;
    }

    double totalPrice = (foodPrice + addonPrice);
    return totalPrice;
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
