import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';

class FoodDetailsArgs {
  final FoodModel food;
  final String? uid;
  final CartItemModel? cartItem;
  final List<AddonModel>? selectedAddons;
  final bool cameByCartPage;

  FoodDetailsArgs({
    required this.food,
    this.uid,
    this.cartItem,
    this.selectedAddons,
    this.cameByCartPage = false,
  });
}
