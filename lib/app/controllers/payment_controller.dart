import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/services/database_service/cart_item_database/i_cart_item_database.dart';

class PaymentController {
  final ICartItemDatabase _cartItemDatabase;

  PaymentController({
    required ICartItemDatabase cartItemDatabase,
  }) : _cartItemDatabase = cartItemDatabase;

  Future<CartItemModel> fetchAllDatabase() async {
    final List<CartItemModel> orders = await _cartItemDatabase.fetchAll();

    return orders.last;
  }

  Future deleteAllDatabase() async {
    await _cartItemDatabase.deleteAll();
  }
}
