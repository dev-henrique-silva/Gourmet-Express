import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/buttons_addons.dart';
import 'package:gourmetexpress/app/components/quantity_selector.dart';
import 'package:gourmetexpress/app/components/total_value.dart';
import 'package:gourmetexpress/app/controllers/cart_controller.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/debouncer/debouncer.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';

class CustomCartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final String uid;
  final Function() onDelete;
  final CartController cartController;

  const CustomCartTile({
    Key? key,
    required this.cartItem,
    required this.uid,
    required this.onDelete,
    required this.cartController,
  }) : super(key: key);

  @override
  State<CustomCartTile> createState() => _CustomCartTileState();
}

class _CustomCartTileState extends State<CustomCartTile> with NavigationMixin {
  CartItemModel get cartItem => widget.cartItem;
  String get uid => widget.uid;
  CartController get cartController => widget.cartController;
  Function() get onDelete => widget.onDelete;
  late Debouncer _debouncer;
  double _heightCard = 120;
  int quantity = 0;

  @override
  void initState() {
    _debouncer = Debouncer(milliseconds: 800);
    quantity = cartItem.quantity;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizeCard(context);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomCartTile oldWidget) {
    sizeCard(context);
    super.didUpdateWidget(oldWidget);
  }

  void sizeCard(BuildContext context) {
    if (cartItem.selectedAddons.isNotEmpty) {
      _heightCard = MediaQuery.of(context).size.height * 0.20;
    } else {
      _heightCard = MediaQuery.of(context).size.height * 0.14;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToFoodDetailsPage(
        context,
        uid: uid,
        selectedAddons: cartItem.selectedAddons,
        food: cartItem.food,
        cameByCartPage: true,
        cartItem: cartItem,
      ),
      child: Container(
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
                height: _heightCard,
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
                              cartController.sumTotalValue(cartItem);
                            });

                            _debouncer.run(
                              () {
                                cartController.putCartItem(
                                  uid: uid,
                                  updatedCartItem: cartItem.copyWith(
                                    quantity: cartItem.quantity,
                                    totalPrice: cartItem.totalPrice,
                                  ),
                                );
                              },
                            );
                          },
                          onDecrement: () {
                            if (cartItem.quantity <= 1) {
                              return;
                            } else {
                              setState(() {
                                cartItem.quantity--;
                                cartController.subtrationTotalValue(cartItem);
                              });

                              _debouncer.run(
                                () {
                                  cartController.putCartItem(
                                    uid: uid,
                                    updatedCartItem: cartItem.copyWith(
                                      quantity: cartItem.quantity,
                                      totalPrice: cartItem.totalPrice,
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    Positioned(
                      top: 75,
                      left: 115,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        children: [
                          if (cartItem.selectedAddons.isNotEmpty) ...[
                            ButtonsAddons(cartItem: cartItem)
                          ],
                          if (cartItem.selectedAddons.isEmpty)
                            const SizedBox(height: 10),
                          TotalValue(cartItem: cartItem),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
