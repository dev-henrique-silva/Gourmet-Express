import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_card_order.dart';
import 'package:gourmetexpress/app/components/custom_scroll_behavior.dart';
import 'package:gourmetexpress/app/controllers/orders_controller.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class OrdersView extends StatefulWidget {
  final String uid;
  final OrdersController ordersController;

  const OrdersView({
    super.key,
    required this.uid,
    required this.ordersController,
  });

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> with NavigationMixin {
  String get uid => widget.uid;
  OrdersController get ordersController => widget.ordersController;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () => goToHomePage(
              context,
              uid: uid,
              pushAndRemoveUntil: true,
            ),
          ),
          title: Text(
            AppString.meusPedidos.texto,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        body: StreamBuilder<List<OrderModel>>(
            stream: ordersController.getOrders(uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return snapshot.data!.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.fastfood_outlined,
                              size: 100,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              AppString.voceAindaNaoPossuiPedidos.texto,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final order = snapshot.data![index];

                          return GestureDetector(
                            onTap: () {
                              goToOrderDetailsPage(
                                context,
                                uid: uid,
                                orderId: order.id!,
                                justView: true,
                              );
                            },
                            child: CustomCardOrder(order: order),
                          );
                        },
                      );
              }
            }),
      ),
    );
  }
}
