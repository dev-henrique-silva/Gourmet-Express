import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/food.dart';

class CartItemModel {
  final String? id;
  final FoodModel food;
  final double quantity;
  final double totalPrice;
  final List<AddonModel> selectedAddons;
  final Timestamp timestamp;
  CartItemModel({
    this.id,
    required this.food,
    required this.selectedAddons,
    this.quantity = 0,
    this.totalPrice = 0.0,
    required this.timestamp,
  });

  factory CartItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CartItemModel(
      id: snapshot.id,
      food: snapshot['food'],
      quantity: snapshot['quantity'],
      totalPrice: snapshot['totalPrice'],
      selectedAddons: List<AddonModel>.from(
          snapshot['availableAddons'].snapshot((x) => AddonModel.fromMap(x))),
      timestamp: snapshot['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'food': food,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'selectedAddons': selectedAddons,
      'timestamp': timestamp,
    };
  }
}
