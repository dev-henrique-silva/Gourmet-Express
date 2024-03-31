import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:gourmetexpress/app/models/food.dart';
import 'package:gourmetexpress/app/services/food_service/i_food_service.dart';

class FoodService implements IFoodService {
  @override
  Future<List<FoodModel>> getBurgers() async {
    final response = await rootBundle.loadString("assets/mocks/burger.json");

    List<dynamic> list = jsonDecode(response);
    return list.map((item) => FoodModel.fromMap(item)).toList();
  }

  @override
  Future<List<FoodModel>> getSalads() async {
    final response = await rootBundle.loadString("assets/mocks/salads.json");

    List<dynamic> list = jsonDecode(response);
    return list.map((item) => FoodModel.fromMap(item)).toList();
  }

  @override
  Future<List<FoodModel>> getDesserts() async {
    final response = await rootBundle.loadString("assets/mocks/desserts.json");

    List<dynamic> list = jsonDecode(response);
    return list.map((item) => FoodModel.fromMap(item)).toList();
  }

  @override
  Future<List<FoodModel>> getDrinks() async {
    final response = await rootBundle.loadString("assets/mocks/drinks.json");

    List<dynamic> list = jsonDecode(response);
    return list.map((item) => FoodModel.fromMap(item)).toList();
  }
}
