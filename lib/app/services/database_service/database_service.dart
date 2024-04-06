import 'package:gourmetexpress/app/services/database_service/cart_item_database/cart_item_database.dart';
import 'package:gourmetexpress/app_inject.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'database.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    return openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
  }

  Future<void> create(Database database, int version) async {
    await CartItemDatabase(
      databaseService: getIt<DatabaseService>(),
    ).createTable(database);
  }
}
