// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static Database? _database;
//   static final _tableName = 'todos';

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDB();
//     return _database!;
//   }

//   Future<Database> initDB() async {
//     String path = join(await getDatabasesPath(), 'todo_database.db');
//     return await openDatabase(path, version: 1, onCreate: _createTable);
//   }

//   Future<void> _createTable(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $_tableName(
//         id TEXT PRIMARY KEY,
//         todoText TEXT,
//         isDone INTEGER
//       )
//     ''');
//   }

//   Future<int> insertTodoMap(Map<String, dynamic> row) async {
//     Database db = await database;
//     return await db.insert(_tableName, row);
//   }

//   Future<List<Map<String, dynamic>>> queryAllTodos() async {
//     Database db = await database;
//     return await db.query(_tableName);
//   }

//   Future<int> updateTodo(Map<String, dynamic> row) async {
//     Database db = await database;
//     return await db.update(_tableName, row,
//         where: 'id = ?', whereArgs: [row['id']]);
//   }

//   Future<int> deleteTodo(String id) async {
//     Database db = await database;
//     return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
//   }
// }


// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper.internal();

//   factory DatabaseHelper() => _instance;

//   static Database? _db;

//   DatabaseHelper.internal();

//   Future<Database?> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }

//   Future<Database> initDb() async {
//     String databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'todo.db');
//     var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return theDb;
//   }

//   void _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE todo (
//         id TEXT PRIMARY KEY,
//         todoText TEXT,
//         isDone INTEGER
//       )
//     ''');
//   }

//   Future<int> insertOrUpdate(Map<String, dynamic> data) async {
//     var dbClient = await db;
//     return await dbClient!.insert('todo', data,
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   Future<int> delete(String id) async {
//     var dbClient = await db;
//     return await dbClient!.delete(
//       'todo',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   Future<List<Map<String, dynamic>>> getTodos() async {
//     var dbClient = await db;
//     return await dbClient!.query('todo');
//   }
// }


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper._internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo (
        id TEXT PRIMARY KEY,
        todoText TEXT,
        isDone INTEGER
      )
    ''');
  }

  Future<int> insertOrUpdate(Map<String, dynamic> data) async {
    var dbClient = await db;
    return await dbClient!.insert('todo', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(String id) async {
    var dbClient = await db;
    return await dbClient!
        .delete('todo', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    var dbClient = await db;
    return await dbClient!.query('todo');
  }
}
