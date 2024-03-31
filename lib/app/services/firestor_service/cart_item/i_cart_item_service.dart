import 'package:gourmetexpress/app/models/cart_item_model.dart';

abstract class ICartItemService {
  Future<void> postCartItem(String? uid, CartItemModel cartItemModel);
  Stream<List<CartItemModel>> getACartItemStream(String uid);
  Future<void> putCartItem(String uid, CartItemModel updatedCartItem);
}
