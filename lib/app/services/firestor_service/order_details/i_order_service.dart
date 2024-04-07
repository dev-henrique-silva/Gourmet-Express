import 'package:gourmetexpress/app/models/order_model.dart';

abstract class IOrderService {
  Future<void> postOrder(String? uid, OrderModel orderModel);
  Stream<List<OrderModel>> getOrderStream(String uid);
  Future<void> putOrder(String uid, OrderModel updatedOrder);
  Future<void> deleteAllOrders(String uid);
  Future<void> deleteOrderById(String uid, String orderId);
}
