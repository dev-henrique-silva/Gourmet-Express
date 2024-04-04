import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';

class CartItemModel {
  final String? id;
  final FoodModel food;
  int quantity;
  double totalPrice;
  final List<AddonModel> selectedAddons;
  final Timestamp timestamp;
  CartItemModel({
    this.id,
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
    this.totalPrice = 0.0,
    required this.timestamp,
  });

  factory CartItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return CartItemModel(
      id: data['id'] ?? snapshot.id,
      food: data['food'],
      quantity: data['quantity'],
      totalPrice: data['totalPrice'],
      selectedAddons: List<AddonModel>.from(
          data['availableAddons'].data((x) => AddonModel.fromMap(x))),
      timestamp: data['timestamp'],
    );
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map, String id) {
    return CartItemModel(
      id: id,
      food: FoodModel.fromMap(map['food']),
      quantity: map['quantity'],
      totalPrice: map['totalPrice'],
      selectedAddons: List<AddonModel>.from(
          map['selectedAddons'].map((addon) => AddonModel.fromMap(addon))),
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'food': food.toMap(),
      'quantity': quantity,
      'totalPrice': totalPrice,
      'selectedAddons': selectedAddons.map((addon) => addon.toMap()).toList(),
      'timestamp': timestamp,
    };
  }

  CartItemModel copyWith({
    String? id,
    FoodModel? food,
    int? quantity,
    double? totalPrice,
    List<AddonModel>? selectedAddons,
    Timestamp? timestamp,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      selectedAddons: selectedAddons ?? this.selectedAddons,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
