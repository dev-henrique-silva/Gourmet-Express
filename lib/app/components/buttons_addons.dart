import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';

class ButtonsAddons extends StatelessWidget {
  final CartItemModel cartItem;
  const ButtonsAddons({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Wrap(
        children: List.generate(
          cartItem.selectedAddons.length,
          (index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: IgnorePointer(
              ignoring: true,
              child: FilterChip(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: EdgeInsets.zero,
                label: Column(
                  children: [
                    Text(
                      cartItem.selectedAddons[index].name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      cartItem.selectedAddons[index].price.toReal(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onSelected: (value) {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
