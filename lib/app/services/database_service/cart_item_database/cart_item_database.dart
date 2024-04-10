import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/services/database_service/cart_item_database/i_cart_item_database.dart';
import 'package:gourmetexpress/app/services/database_service/database_service.dart';
import 'package:sqflite/sqflite.dart';

class CartItemDatabase implements ICartItemDatabase {
  final DatabaseService _databaseService;
  CartItemDatabase({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final String tableName = 'cartItem';

  @override
  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        idDatabase INTEGER PRIMARY KEY AUTOINCREMENT,
        food TEXT,
        quantity INTEGER,
        totalPrice REAL,
        selectedAddons TEXT
      );
    ''');
  }

  @override
  Future<void> insert(Map<String, dynamic> data) async {
    final database = await _databaseService.database;
    await database.insert(tableName, data);
  }

  @override
  Future<void> update(Map<String, dynamic> data) async {
    final database = await _databaseService.database;
    await database.update(
      tableName,
      data,
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [data['id']],
    );
  }

  @override
  Future<void> delete(int id) async {
    final database = await _databaseService.database;
    await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> deleteAll() async {
    final database = await _databaseService.database;
    await database.delete(tableName);
  }

  @override
  Future<List<Map<String, dynamic>>> getData() async {
    final database = await _databaseService.database;
    return database.query(tableName);
  }

  @override
  Future<List<CartItemModel>> fetchAll() async {
    final List<Map<String, dynamic>> orders = await getData();
    return orders
        .map((order) => CartItemModel.fromSqlfiteDatabase(order))
        .toList();
  }

  @override
  Future<CartItemModel> fetchById(int id) async {
    final List<Map<String, dynamic>> orders = await getData();
    final order = orders.firstWhere((order) => order['id'] == id);
    return CartItemModel.fromSqlfiteDatabase(order);
  }
}
