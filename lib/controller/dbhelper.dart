import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class dbhelper {
  static final dbhelper instance = dbhelper._getInstance();
  static Database? _database;

  dbhelper._getInstance();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'my_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db!.insert('users', row);
  }

  Future<Map<String, dynamic>> getUser(String username) async {
    final db = await instance.database;
    final result = await db!.query('users',
        where: 'username = ?', whereArgs: [username], limit: 1);

    return result.isNotEmpty ? result.first : {};
  }
}

