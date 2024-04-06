import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class ICartItemDatabase {
  Future<void> createTable(Database database);
  Future<void> insert(Map<String, dynamic> data);
  Future<void> update(Map<String, dynamic> data);
  Future<void> delete(int id);
  Future<void> deleteAll();
  Future<List<Map<String, dynamic>>> getData();
  Future<List<CartItemModel>> fetchAll();
  Future<CartItemModel> fetchById(int id);
}
