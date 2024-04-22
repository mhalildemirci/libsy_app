import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'images';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<bool> isImageAdded(String imagePath) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: 'imagePath = ?',
      whereArgs: [imagePath],
    );
    return result.isNotEmpty;
  }

  static Future<Database> initDB() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'my_database.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            imagePath TEXT
          )
          ''',
        );
      },
    );
  }

  static Future<int> insertImage(String imagePath) async {
    final db = await database;
    return await db.insert(tableName, {'imagePath': imagePath});
  }

  static Future<List<String>> getImages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return maps[i]['imagePath'];
    });
  }
}
