import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/cart_item_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/i_cart_item_service.dart';

class FoodDetailsController {
  final ICartItemService _cartItemService;

  FoodDetailsController({
    required CartItemService cartItemService,
  }) : _cartItemService = cartItemService;

  Future<void> postCartItem({
    required FoodModel food,
    required String uid,
    required ValueNotifier<List<bool>> selectedAvailableAddons,
  }) async {
    final selectedAddons = _getSelectedAddons(food, selectedAvailableAddons);

    await _cartItemService.postCartItem(
      uid,
      CartItemModel(
        food: food,
        selectedAddons: selectedAddons,
        totalPrice: _calculateTotalPrice(food.price, selectedAddons),
        timestamp: Timestamp.now(),
      ),
    );
  }

  Stream<List<CartItemModel>> getACartItemStream({required String uid}) {
    return _cartItemService.getCartItemStream(uid);
  }

  Future<void> putCartItem({
    required String uid,
    required CartItemModel updatedCartItem,
    required ValueNotifier<List<bool>> selectedAvailableAddons,
  }) async {
    final selectedAddons =
        _getSelectedAddons(updatedCartItem.food, selectedAvailableAddons);

    await _cartItemService.putCartItem(
      uid,
      updatedCartItem.copyWith(selectedAddons: selectedAddons),
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

  List<AddonModel> _getSelectedAddons(
      FoodModel food, ValueNotifier<List<bool>> selectedAvailableAddons) {
    return selectedAvailableAddons.value
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => food.availableAddons[entry.key])
        .toList();
  }

  void fillSelectedAddons(FoodModel food, List<AddonModel>? selectedAddons,
      ValueNotifier<List<bool>> selectedAvailableAddons) {
    selectedAvailableAddons.value =
        List.generate(food.availableAddons.length, (_) => false);

    for (int i = 0; i < food.availableAddons.length; i++) {
      if (selectedAddons != null && i < selectedAddons.length) {
        final addon = selectedAddons[i];
        for (int j = 0; j < selectedAvailableAddons.value.length; j++) {
          if (selectedAvailableAddons.value[j] == false &&
              food.availableAddons[j].name.contains(addon.name)) {
            selectedAvailableAddons.value[j] = true;
            break;
          }
        }
      }
    }
  }
}
