import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fruits_app/data/models/fruit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fruits_app/data/mappers/fruit_mapper.dart';

class DBManager {
  static Database? _database;
  static final DBManager db = DBManager._();

  DBManager._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'FruitsDB.db');
    // print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''

        CREATE TABLE Fruits(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          description TEXT
        )

        ''');
      },
    );
  }

  Future<List<Fruit>> getFruits() async {
    final db = await database;
    final res = await db!.query('Fruits');
    return res.isNotEmpty ? res.map((s) => fromJsonFruit(s)).toList() : [];
  }

  Future<int> registerFruit(Fruit fruit) async {
    final db = await database;
    return await db!.insert('Fruits', toJsonFruit(fruit));
  }

  Future<int> updateFruit(Fruit fruit) async {
    final db = await database;
    return await db!.update('Fruits', toJsonFruit(fruit),
        where: 'id = ?', whereArgs: [fruit.id]);
  }

  Future<int> deleteFruit(int id) async {
    final db = await database;
    return await db!.delete('Fruits', where: 'id = ?', whereArgs: [id]);
  }
}
