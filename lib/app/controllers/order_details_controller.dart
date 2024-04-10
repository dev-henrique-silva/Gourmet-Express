import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/i_order_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/order_service.dart';

class OrderDetailsController {
  final IOrderService _orderService;

  OrderDetailsController({
    required OrderService orderService,
  }) : _orderService = orderService;

  Stream<OrderModel> getOrder(String uid) {
    return _orderService.getLastOrderStream(uid);
  }
}
