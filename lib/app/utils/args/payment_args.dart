class PaymentArgs {
  final String uid;
  final bool cameByCartPage;

  PaymentArgs({
    required this.uid,
    this.cameByCartPage = false,
  });
}
