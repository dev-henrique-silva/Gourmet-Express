import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/i_order_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/order_service.dart';

class OrdersController {
  final IOrderService _orderService;

  OrdersController({
    required OrderService orderService,
  }) : _orderService = orderService;

  Stream<List<OrderModel>> getOrders(String uid) {
    return _orderService.getOrdersStream(uid);
  }
}
