import 'package:gourmetexpress/app/models/addon_model.dart';

class FoodModel {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String category;
  final List<AddonModel> availableAddons;

  FoodModel({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      price: json['price'] as double,
      category: json['category'] as String,
      availableAddons: (json['availableAddons'] as List<dynamic>)
          .map((addonJson) =>
              AddonModel.fromJson(addonJson as Map<String, dynamic>))
          .toList(),
    );
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
      price: map['price'],
      category: map['category'],
      availableAddons: List<AddonModel>.from(
          map['availableAddons'].map((x) => AddonModel.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'category': category,
      'availableAddons': availableAddons.map((addon) => addon.toMap()).toList(),
    };
  }
}
