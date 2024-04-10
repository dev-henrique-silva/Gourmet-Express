import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class OrderReceipt extends StatelessWidget {
  final OrderModel order;

  const OrderReceipt({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ReceiptString.aquiEstaOSeuRecibo.texto),
          const SizedBox(height: 10),
          Text(order.orderDate),
          const SizedBox(height: 20),
          Text(ReceiptString.divisorDePedidos.texto),
          ListView.builder(
            shrinkWrap: true,
            itemCount: order.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = order.cartItems[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${cartItem.quantity.toString()}x'),
                      const SizedBox(width: 5),
                      Text(cartItem.food.name),
                      const SizedBox(width: 5),
                      const Text("-"),
                      const SizedBox(width: 5),
                      Text(cartItem.food.price.toReal()),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: order.cartItems.length,
                    itemBuilder: (context, index) {
                      final addons = cartItem.selectedAddons[index];

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  '${cartItem.quantity.toString()}x',
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  addons.name,
                                  style: const TextStyle(fontSize: 11),
                                ),
                                const SizedBox(width: 5),
                                const Text("-"),
                                const SizedBox(width: 5),
                                Text(
                                  addons.price.toReal(),
                                  style: const TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Text(ReceiptString.divisorDePedidos.texto),
                ],
              );
            },
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Text(ReceiptString.custoDaEntrega.texto),
              const SizedBox(width: 5),
              Text(order.deliveryCost.toReal()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(ReceiptString.totalDeItens.texto),
              const SizedBox(width: 5),
              Text(order.totalItems.toString()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(ReceiptString.totalAPagar.texto),
              const SizedBox(width: 5),
              Text(order.totalPayable.toReal()),
            ],
          ),
        ],
      ),
    );
  }
}
