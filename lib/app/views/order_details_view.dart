import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/order_details/receipt.dart';
import 'package:gourmetexpress/app/controllers/order_details_controller.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class OrderDetailsView extends StatefulWidget {
  final String uid;
  final OrderDetailsController orderDetailsController;

  const OrderDetailsView({
    super.key,
    required this.uid,
    required this.orderDetailsController,
  });

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView>
    with NavigationMixin {
  String get uid => widget.uid;
  OrderDetailsController get orderDetailsController =>
      widget.orderDetailsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          onPressed: () {
            goToHomePage(
              context,
              uid: uid,
              pushAndRemoveUntil: true,
            );
          },
        ),
        title: Text(
          ReceiptString.detalhesDoPedido.texto,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: Receipt(
        uid: uid,
        orderDetailsController: orderDetailsController,
      ),
    );
  }
}
