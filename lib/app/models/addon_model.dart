class AddonModel {
  final String name;
  final double price;

  AddonModel({
    required this.name,
    required this.price,
  });

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(
      name: json['name'] as String,
      price: json['price'] as double,
    );
  }

  factory AddonModel.fromMap(Map<String, dynamic> map) {
    return AddonModel(
      name: map['name'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }
}
