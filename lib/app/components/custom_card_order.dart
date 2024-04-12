import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class CustomCardOrder extends StatelessWidget {
  final OrderModel order;
  const CustomCardOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                            right: 8.0,
                          ),
                          child: Image.asset(ImagesAssets.logoWithIcon),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppString.gourmetExpress.texto,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                    ],
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.background,
                    indent: 1,
                    endIndent: 1,
                    thickness: 0.6,
                  ),
                  order.confirmedDelivery
                      ? Row(
                          children: [
                            const Icon(
                              Icons.check_circle_rounded,
                              size: 15,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 5),
                            Text(AppString.pedidoConcluido.texto),
                          ],
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.motorcycle_outlined,
                              size: 15,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(AppString.pedidoEmAndamento.texto),
                          ],
                        ),
                  const SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: order.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = order.cartItems[index];

                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(cartItem.quantity.toString()),
                          ),
                          const SizedBox(width: 3),
                          Text(cartItem.food.name),
                        ],
                      );
                    },
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.background,
                    indent: 1,
                    endIndent: 1,
                    thickness: 0.6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order.orderDate),
                      Text(order.totalPayable.toReal()),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
