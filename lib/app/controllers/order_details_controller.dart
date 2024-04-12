import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/i_order_service.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/order_service.dart';
import 'package:gourmetexpress/app/utils/args/order_datails_args.dart';

class OrderDetailsController {
  final IOrderService _orderService;

  OrderDetailsController({
    required OrderService orderService,
  }) : _orderService = orderService;

  Stream<OrderModel> getOrder({required OrderDetailsArgs orderDetailsArgs}) {
    if (orderDetailsArgs.justView) {
      return _orderService.getOrderById(
        orderDetailsArgs.uid,
        orderDetailsArgs.orderId,
      );
    } else {
      return _orderService.getCurrentOrderStream(orderDetailsArgs.uid);
    }
  }

  Future<void> confirmDelivery({
    required String uid,
    required OrderModel updatedOrder,
  }) {
    return _orderService.putOrder(uid, updatedOrder);
  }
}
