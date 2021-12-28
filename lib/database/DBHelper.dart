import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tutodo/model/tasks.dart';

class DBHelper {
  static Database? _db;
  static const String TABLE = 'Cart';
  static const String DB_NAME = 'my_cart.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $TABLE (id integer primary key autoincrement, title TEXT, time TEXT, active INTEGER)",
    );
  }

  Future<Tasks> save(Tasks Tasks) async {
    var dbClient = await db;
    Tasks.id = await dbClient.insert(TABLE, Tasks.toMap());
    return Tasks;
  }

  Future<List<Tasks>> getCart() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query(TABLE, columns: [
      'id',
      'title',
      'time',
      'active',
    ]);
    List<Tasks> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Tasks.fromMap(maps[i]));
      }
    }
    return employees;
  }

  Future<int> deleteItem(String id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateProduct(Tasks Tasks) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, Tasks.toMap(),
        where: 'id = ?', whereArgs: [Tasks.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
