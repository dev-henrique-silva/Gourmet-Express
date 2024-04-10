import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class DeliveryConfirmation extends StatefulWidget {
  final OrderModel order;

  const DeliveryConfirmation({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<DeliveryConfirmation> createState() => _DeliveryConfirmationState();
}

class _DeliveryConfirmationState extends State<DeliveryConfirmation>
    with NavigationMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.order.confirmedDelivery
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
                onPressed: () {},
                margin: 50,
                padding: 15,
                borderRadius: 25,
              ),
        const SizedBox(height: 15),
        CustomButton(
          text: ReceiptString.entrarEmContato.texto,
          onPressed: () {
            goToContactPage(context);
          },
          margin: 50,
          padding: 15,
          borderRadius: 25,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
