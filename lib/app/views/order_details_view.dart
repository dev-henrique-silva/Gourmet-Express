import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/order_details/receipt.dart';
import 'package:gourmetexpress/app/controllers/order_details_controller.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/args/order_datails_args.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class OrderDetailsView extends StatefulWidget {
  final OrderDetailsArgs orderDetailsArgs;

  final OrderDetailsController orderDetailsController;

  const OrderDetailsView({
    Key? key,
    required this.orderDetailsArgs,
    required this.orderDetailsController,
  }) : super(key: key);

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView>
    with NavigationMixin {
  OrderDetailsArgs get orderDetailsArgs => widget.orderDetailsArgs;
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
            if (orderDetailsArgs.justView) {
              Navigator.pop(context);
            } else {
              goToHomePage(
                context,
                uid: orderDetailsArgs.uid,
                pushAndRemoveUntil: true,
              );
            }
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
        orderDetailsArgs: orderDetailsArgs,
        orderDetailsController: orderDetailsController,
      ),
    );
  }
}
