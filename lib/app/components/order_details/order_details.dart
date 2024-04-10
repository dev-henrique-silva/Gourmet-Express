import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/order_details/delivery_confirmation.dart';
import 'package:gourmetexpress/app/components/order_details/estimated_delivery_time.dart';
import 'package:gourmetexpress/app/components/order_details/order_receipt.dart';
import 'package:gourmetexpress/app/controllers/order_details_controller.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class OrderDetails extends StatelessWidget {
  final OrderModel? order;
  final String uid;
  final OrderDetailsController orderDetailsController;

  const OrderDetails({
    Key? key,
    required this.order,
    required this.uid,
    required this.orderDetailsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (order == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Text(ReceiptString.obrigadoPeloSeuPedido.texto),
        const SizedBox(height: 25),
        OrderReceipt(order: order!),
        const SizedBox(height: 25),
        EstimatedDeliveryTime(order: order!),
        const Spacer(),
        DeliveryConfirmation(
          order: order!,
          uid: uid,
          orderDetailsController: orderDetailsController,
        ),
      ],
    );
  }
}
