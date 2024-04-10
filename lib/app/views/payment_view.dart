import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_credit_card.dart';
import 'package:gourmetexpress/app/controllers/payment_controller.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/args/payment_args.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class PaymentView extends StatefulWidget {
  final PaymentArgs paymentArgs;

  final PaymentController paymentController;

  const PaymentView({
    Key? key,
    required this.paymentController,
    required this.paymentArgs,
  }) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with NavigationMixin {
  String get uid => widget.paymentArgs.uid;
  String? get cartItemId => widget.paymentArgs.cartItem?.id;
  bool get cameByCartPage => widget.paymentArgs.cameByCartPage;
  bool get deleteAllCart => widget.paymentArgs.deleteAllCart;
  PaymentController get paymentController => widget.paymentController;

  @override
  void didChangeDependencies() {
    paymentController.fetchAllDatabase();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    paymentController.deleteAllDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppString.pagamento.texto,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: CustomCreditCard(
        onPressed: () {
          Navigator.of(context).pop();
          paymentController.postOrder(uid: uid);
          goToOrderDetailsPage(
            context,
            uid: uid,
          );
          paymentController.deleteAllDatabase();

          if (deleteAllCart) {
            paymentController.deleteAllCartItems(uid: uid);
          } else if (cameByCartPage && cartItemId != null) {
            paymentController.deleteCartItemById(uid: uid, itemId: cartItemId!);
          }
        },
      ),
    );
  }
}
