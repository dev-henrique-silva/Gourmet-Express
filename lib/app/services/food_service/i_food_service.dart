import 'package:gourmetexpress/app/models/food.dart';

abstract class IFoodService {
  Future<List<FoodModel>> getBurgers();
  Future<List<FoodModel>> getSalads();
  Future<List<FoodModel>> getDesserts();
  Future<List<FoodModel>> getDrinks();
}
