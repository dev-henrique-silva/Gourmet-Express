import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/models/order_model.dart';
import 'package:gourmetexpress/app/services/database_service/cart_item_database/i_cart_item_database.dart';
import 'package:gourmetexpress/app/services/firestor_service/order_details/i_order_service.dart';
import 'package:intl/intl.dart';

class PaymentController {
  final ICartItemDatabase _cartItemDatabase;
  final IOrderService _iOrderService;

  PaymentController({
    required ICartItemDatabase cartItemDatabase,
    required IOrderService iOrderService,
  })  : _cartItemDatabase = cartItemDatabase,
        _iOrderService = iOrderService;

  static const double deliveryCost = 4.99;
  List<CartItemModel> cartItems = [];

  Future<List<CartItemModel>> fetchAllDatabase() async {
    cartItems = await _cartItemDatabase.fetchAll();

    return cartItems;
  }

  Future deleteAllDatabase() async {
    await _cartItemDatabase.deleteAll();
  }

  Future<void> postOrder({
    required String? uid,
  }) async {
    final orderModel = OrderModel(
      cartItems: cartItems,
      deliveryCost: deliveryCost,
      orderDate: _orderDate(),
      totalItems: _calculateTotalItems(),
      totalPayable: _calculateTotalValue(),
      estimatedDeliveryTime: _estimatedDeliveryTime(),
    );
    await _iOrderService.postOrder(uid, orderModel);
  }

  String _orderDate() {
    DateTime dataTimeNow = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    String dateFormatted = formatter.format(dataTimeNow);

    return dateFormatted;
  }

  String _estimatedDeliveryTime() {
    DateTime dateTimeNow = DateTime.now();
    DateTime dateTimePlusOneHour = dateTimeNow.add(const Duration(hours: 1));
    var formatter = DateFormat('HH:mm');
    String dateFormatted = formatter.format(dateTimePlusOneHour);

    return dateFormatted;
  }

  int _calculateTotalItems() {
    int totalItems = 0;

    for (var element in cartItems) {
      totalItems += element.quantity;
    }

    return totalItems;
  }

  double _calculateTotalValue() {
    double foodPrice = 0.0;
    double addonPrice = 0.0;
    int quantity = 0;
    double totalPayable = 0.0;

    for (var element in cartItems) {
      foodPrice += element.food.price;
      quantity += element.quantity;
      for (var addon in element.selectedAddons) {
        addonPrice += addon.price;
      }
    }

    totalPayable = (foodPrice + addonPrice) * quantity + deliveryCost;

    return totalPayable;
  }
}
