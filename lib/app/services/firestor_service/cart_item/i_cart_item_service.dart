import 'package:gourmetexpress/app/models/cart_item_model.dart';

abstract class ICartItemService {
  Future<void> postCartItem(String? uid, CartItemModel cartItemModel);
  Stream<List<CartItemModel>> getCartItemStream(String uid);
  Future<void> putCartItem(String uid, CartItemModel updatedCartItem);
  Future<void> deleteAllCartItems(String uid);
  Future<void> deleteCartItemById(String uid, String cartItemId);
}
