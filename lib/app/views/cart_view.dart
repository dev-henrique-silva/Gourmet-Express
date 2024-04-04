import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_cart_tile.dart';
import 'package:gourmetexpress/app/controllers/cart_controller.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';
import 'package:gourmetexpress/app/utils/strings/home_string.dart';

class CartView extends StatefulWidget {
  final String uid;
  final CartController cartController;

  const CartView({
    Key? key,
    required this.uid,
    required this.cartController,
  }) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String get uid => widget.uid;
  CartController get cartController => widget.cartController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartItemModel>>(
      stream: cartController.getCartItemStream(uid: uid),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              AppString.gourmetExpress.texto,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            actions: snapshot.hasData && snapshot.data!.isNotEmpty
                ? [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        onPressed: () {
                          cartController.deleteAllCartItems(uid: uid);
                        },
                      ),
                    ),
                  ]
                : [],
          ),
          body: Column(
            children: [
              if (snapshot.data != null && snapshot.data!.isNotEmpty)
                Divider(
                  color: Theme.of(context).colorScheme.onPrimary,
                  indent: 25,
                  endIndent: 25,
                ),
              Expanded(
                child: snapshot.hasData
                    ? snapshot.data!.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.shopping_cart,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                                Text(
                                  HomeString.seuCarrinhoEstaVazio.texto,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              final cartItem = snapshot.data![index];
                              return CustomCartTile(
                                cartItem: cartItem,
                                uid: uid,
                                onDelete: () =>
                                    cartController.deleteCartItemById(
                                  uid: uid,
                                  itemId: cartItem.id!,
                                ),
                                cartController: cartController,
                              );
                            },
                          )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
