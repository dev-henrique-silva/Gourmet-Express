import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class TotalValue extends StatelessWidget {
  final CartItemModel cartItem;
  const TotalValue({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppString.total.texto,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            cartItem.totalPrice.toReal(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
