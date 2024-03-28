import 'package:gourmetexpress/app/models/food.dart';
import 'package:gourmetexpress/app/services/food_service/food_service.dart';
import 'package:gourmetexpress/app/services/food_service/i_food_service.dart';

class HomeController {
  final IFoodService _foodService;

  const HomeController({required FoodService foodService})
      : _foodService = foodService;

  Future<List<Food>> getBurgers() async {
    return await _foodService.getBurgers();
  }

  Future<List<Food>> getSalads() async {
    return await _foodService.getSalads();
  }

  Future<List<Food>> getDesserts() async {
    return await _foodService.getDesserts();
  }

  Future<List<Food>> getDrinks() async {
    return await _foodService.getDrinks();
  }
}
