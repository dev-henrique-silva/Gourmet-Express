import 'package:gourmetexpress/app/models/cart_item_model.dart';

class PaymentArgs {
  final String uid;
  final CartItemModel? cartItem;
  final bool cameByCartPage;
  final bool deleteAllCart;

  PaymentArgs({
    required this.uid,
    this.cartItem,
    this.cameByCartPage = false,
    this.deleteAllCart = false,
  });
}
