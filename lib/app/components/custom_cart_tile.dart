import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/quantity_selector.dart';
import 'package:gourmetexpress/app/controllers/cart_controller.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/utils/debouncer/debouncer.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';

class CustomCartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function() onDelete;
  final CartController cartController;

  const CustomCartTile({
    Key? key,
    required this.cartItem,
    required this.onDelete,
    required this.cartController,
  }) : super(key: key);

  @override
  State<CustomCartTile> createState() => _CustomCartTileState();
}

class _CustomCartTileState extends State<CustomCartTile> {
  CartItemModel get cartItem => widget.cartItem;
  CartController get cartController => widget.cartController;
  Function() get onDelete => widget.onDelete;
  int quantity = 0;
  late Debouncer _debouncer;

  @override
  void initState() {
    _debouncer = Debouncer(milliseconds: 800);
    quantity = cartItem.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 120),
                      Text(
                        cartItem.food.name,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.delete,
                            size: 16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        cartItem.food.price.toReal(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        onIncrement: () {
                          setState(() {
                            cartItem.quantity++;
                          });

                          _debouncer.run(
                            () {
                              cartController.putCartItem(
                                updatedCartItem: CartItemModel(
                                  id: cartItem.id,
                                  food: cartItem.food,
                                  selectedAddons: cartItem.selectedAddons,
                                  timestamp: cartItem.timestamp,
                                  quantity: cartItem.quantity++,
                                ),
                              );
                            },
                          );
                        },
                        onDecrement: () {
                          setState(() {
                            cartItem.quantity--;
                          });

                          _debouncer.run(
                            () {
                              cartController.putCartItem(
                                updatedCartItem: CartItemModel(
                                  id: cartItem.id,
                                  food: cartItem.food,
                                  selectedAddons: cartItem.selectedAddons,
                                  timestamp: cartItem.timestamp,
                                  quantity: cartItem.quantity--,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    top: 65,
                    left: 115,
                    right: 0,
                    bottom: 0,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Wrap(
                        children: List.generate(
                          cartItem.selectedAddons.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChip(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              padding: EdgeInsets.zero,
                              label: Column(
                                children: [
                                  Text(
                                    cartItem.selectedAddons[index].name,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    cartItem.selectedAddons[index].price
                                        .toReal(),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
