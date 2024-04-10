import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class EstimatedDeliveryTime extends StatelessWidget {
  final OrderModel order;

  const EstimatedDeliveryTime({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(ReceiptString.tempoEstimadoParaEntrega.texto),
        const SizedBox(width: 5),
        Text(order.estimatedDeliveryTime),
      ],
    );
  }
}
