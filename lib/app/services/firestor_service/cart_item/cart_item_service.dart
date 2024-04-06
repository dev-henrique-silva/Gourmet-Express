import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/cart_item/i_cart_item_service.dart';

class CartItemService implements ICartItemService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('Users');

  @override
  Future<void> postCartItem(String? uid, CartItemModel cartItemModel) async {
    notesCollection.doc(uid).collection('cartItem').add(cartItemModel.toMap());
  }

  @override
  Stream<List<CartItemModel>> getCartItemStream(String uid) {
    return notesCollection.doc(uid).collection('cartItem').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => CartItemModel.fromMap(doc.data(), id: doc.id))
            .toList());
  }

  @override
  Future<void> putCartItem(String uid, CartItemModel updatedcartItem) async {
    await notesCollection
        .doc(uid)
        .collection('cartItem')
        .doc(updatedcartItem.id)
        .update(
          updatedcartItem.toMap(),
        );
  }

  @override
  Future<void> deleteCartItemById(String uid, String cartItemId) async {
    await notesCollection
        .doc(uid)
        .collection('cartItem')
        .doc(cartItemId)
        .delete();
  }

  @override
  Future<void> deleteAllCartItems(String uid) async {
    QuerySnapshot cartItemsSnapshot =
        await notesCollection.doc(uid).collection('cartItem').get();

    List<DocumentSnapshot> cartItems = cartItemsSnapshot.docs;

    for (DocumentSnapshot cartItem in cartItems) {
      await cartItem.reference.delete();
    }
  }
}
