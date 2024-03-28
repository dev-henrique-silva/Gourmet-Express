class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });

  factory Addon.fromMap(Map<String, dynamic> map) {
    return Addon(
      name: map['name'],
      price: map['price'],
    );
  }
}
