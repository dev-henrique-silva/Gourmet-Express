import 'package:gourmetexpress/app/models/cart_item_model.dart';

class OrderModel {
  final String? id;
  final String orderDate;
  final String estimatedDeliveryTime;
  final List<CartItemModel> cartItems;
  final double deliveryCost;
  final int totalItems;
  double totalPayable;
  final bool confirmedDelivery;

  OrderModel({
    this.id,
    required this.cartItems,
    required this.orderDate,
    required this.estimatedDeliveryTime,
    required this.deliveryCost,
    required this.totalItems,
    required this.totalPayable,
    this.confirmedDelivery = false,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, {String? id}) {
    return OrderModel(
      id: id,
      cartItems: (map['cartItems'] as List)
          .map((item) => CartItemModel.fromMap(item))
          .toList(),
      orderDate: map['orderDate'],
      estimatedDeliveryTime: map['estimatedDeliveryTime'],
      deliveryCost: map['deliveryCost'],
      totalItems: map['totalItems'],
      totalPayable: map['totalPayable'],
      confirmedDelivery: map['confirmedDelivery'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cartItems': cartItems.map((item) => item.toMap()).toList(),
      'orderDate': orderDate,
      'estimatedDeliveryTime': estimatedDeliveryTime,
      'deliveryCost': deliveryCost,
      'totalItems': totalItems,
      'totalPayable': totalPayable,
      'confirmedDelivery': confirmedDelivery,
    };
  }

  OrderModel copyWith({
    String? id,
    List<CartItemModel>? cartItems,
    String? orderDate,
    String? estimatedDeliveryTime,
    double? deliveryCost,
    int? totalItems,
    double? totalPayable,
    bool? confirmedDelivery,
  }) {
    return OrderModel(
      id: id ?? this.id,
      cartItems: cartItems ?? this.cartItems,
      orderDate: orderDate ?? this.orderDate,
      estimatedDeliveryTime:
          estimatedDeliveryTime ?? this.estimatedDeliveryTime,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      totalItems: totalItems ?? this.totalItems,
      totalPayable: totalPayable ?? this.totalPayable,
      confirmedDelivery: confirmedDelivery ?? this.confirmedDelivery,
    );
  }
}
