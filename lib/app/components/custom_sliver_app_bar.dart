import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class CustomSliverAppBar extends StatefulWidget {
  final Widget title;
  final Widget child;
  final Function() onPressed;
  final String uid;
  final HomeController homeController;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.child,
    required this.onPressed,
    required this.uid,
    required this.homeController,
  });

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  String get uid => widget.uid;
  HomeController get homeController => widget.homeController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 325,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      actions: [
        StreamBuilder<List<CartItemModel>>(
          stream: homeController.getCartItemStream(uid: uid),
          builder: (context, snapshot) {
            final cartItems = snapshot.data ?? [];

            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Badge(
                backgroundColor: Theme.of(context).colorScheme.error,
                isLabelVisible: cartItems.isNotEmpty,
                label: Text(
                  cartItems.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: GestureDetector(
                  onTap: widget.onPressed,
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
      title: Text(AppString.gourmetExpress.texto),
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: widget.child,
        title: widget.title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          left: 0,
          right: 0,
          top: 0,
        ),
        expandedTitleScale: 1,
      ),
    );
  }
}
