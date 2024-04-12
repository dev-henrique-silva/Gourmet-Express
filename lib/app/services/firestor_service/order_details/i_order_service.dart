import 'package:gourmetexpress/app/models/order_model.dart';

abstract class IOrderService {
  Future<void> postOrder(String? uid, OrderModel orderModel);
  Stream<List<OrderModel>> getOrdersStream(String uid);
  Stream<OrderModel> getCurrentOrderStream(String uid);
  Stream<OrderModel> getOrderById(String uid, String orderId);
  Future<void> putOrder(String uid, OrderModel updatedOrder);
  Future<void> deleteAllOrders(String uid);
  Future<void> deleteOrderById(String uid, String orderId);
}
