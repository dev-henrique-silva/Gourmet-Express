import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/order_details/order_details.dart';
import 'package:gourmetexpress/app/controllers/order_details_controller.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/utils/strings/recipt_string.dart';

class Receipt extends StatefulWidget {
  final OrderDetailsController orderDetailsController;
  final String uid;

  const Receipt({
    Key? key,
    required this.orderDetailsController,
    required this.uid,
  }) : super(key: key);

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  String get uid => widget.uid;
  OrderDetailsController get orderDetailsController =>
      widget.orderDetailsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: StreamBuilder<OrderModel>(
          stream: widget.orderDetailsController.getOrder(uid),
          builder: (context, snapshot) {
            final order = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(ReceiptString.erroAoCarregarPedido.texto),
              );
            } else if (order == null) {
              return Center(
                child: Text(ReceiptString.pedidoNaoEncontrado.texto),
              );
            }

            return OrderDetails(
              order: order,
              uid: uid,
              orderDetailsController: orderDetailsController,
            );
          },
        ),
      ),
    );
  }
}
