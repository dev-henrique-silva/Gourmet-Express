import 'package:gourmetexpress/app/models/food.dart';

abstract class IFoodService {
  Future<List<Food>> getBurgers();
  Future<List<Food>> getSalads();
  Future<List<Food>> getDesserts();
  Future<List<Food>> getDrinks();
}
