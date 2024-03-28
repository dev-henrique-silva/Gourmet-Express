import 'package:gourmetexpress/app/models/addon.dart';

class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String category;
  final List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
      price: map['price'],
      category: map['category'],
      availableAddons:
          List<Addon>.from(map['availableAddons'].map((x) => Addon.fromMap(x))),
    );
  }
}
