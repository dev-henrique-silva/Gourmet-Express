import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/controllers/order_details_controller.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class DeliveryConfirmation extends StatefulWidget {
  final OrderModel order;
  final String uid;

  final OrderDetailsController orderDetailsController;

  const DeliveryConfirmation({
    Key? key,
    required this.order,
    required this.uid,
    required this.orderDetailsController,
  }) : super(key: key);

  @override
  State<DeliveryConfirmation> createState() => _DeliveryConfirmationState();
}

class _DeliveryConfirmationState extends State<DeliveryConfirmation>
    with NavigationMixin {
  OrderModel get order => widget.order;
  String get uid => widget.uid;
  OrderDetailsController get orderDetailsController =>
      widget.orderDetailsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        order.confirmedDelivery
            ? Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check, color: Colors.green),
                    const SizedBox(width: 5),
                    Text(
                      ReceiptString.entregaConfirmada.texto,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : CustomButton(
                text: ReceiptString.confirmarEntrega.texto,
                onPressed: () {
                  orderDetailsController.confirmDelivery(
                    uid: uid,
                    updatedOrder: order.copyWith(confirmedDelivery: true),
                  );
                },
                margin: 50,
                padding: 15,
                borderRadius: 25,
              ),
        const SizedBox(height: 15),
        CustomButton(
          text: ReceiptString.entrarEmContato.texto,
          onPressed: () {
            goToContactPage(
              context,
              uid: uid,
              pushAndRemoveUntil: true,
            );
          },
          margin: 50,
          padding: 15,
          borderRadius: 25,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
