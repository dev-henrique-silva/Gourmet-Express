import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/i_order_service.dart';

class OrderService implements IOrderService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('Users');

  @override
  Future<void> postOrder(String? uid, OrderModel orderModel) async {
    notesCollection.doc(uid).collection('order').add(orderModel.toMap());
  }

  @override
  Stream<List<OrderModel>> getOrdersStream(String uid) {
    return notesCollection.doc(uid).collection('order').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromMap(doc.data(), id: doc.id))
            .toList());
  }

  @override
  Stream<OrderModel> getLastOrderStream(String uid) {
    return notesCollection
        .doc(uid)
        .collection('order')
        .orderBy('orderDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => OrderModel.fromMap(doc.data(), id: doc.id))
              .first,
        );
  }

  @override
  Future<void> putOrder(String uid, OrderModel updatedOrder) async {
    await notesCollection
        .doc(uid)
        .collection('order')
        .doc(updatedOrder.id)
        .update(
          updatedOrder.toMap(),
        );
  }

  @override
  Future<void> deleteOrderById(String uid, String orderId) async {
    await notesCollection.doc(uid).collection('order').doc(orderId).delete();
  }

  @override
  Future<void> deleteAllOrders(String uid) async {
    QuerySnapshot ordersSnapshot =
        await notesCollection.doc(uid).collection('order').get();

    List<DocumentSnapshot> orders = ordersSnapshot.docs;

    for (DocumentSnapshot order in orders) {
      await order.reference.delete();
    }
  }
}
