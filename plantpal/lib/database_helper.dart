import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static const _dbName = 'plantpal.db';
  static const _dbVersion = 1;

  DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, _dbName),
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE accessories (
      id INTEGER PRIMARY KEY,
      name TEXT,
      usageInstruction TEXT,
      description TEXT,
      price REAL,
      stock INTEGER
    )
  ''');

    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY,
      username TEXT,
      password TEXT,
      name TEXT,
      address TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE plants (
      id INTEGER PRIMARY KEY,
      name TEXT,
      species TEXT,
      description TEXT,
      price REAL,
      stock INTEGER
    )
  ''');

    await db.execute('''
    CREATE TABLE billing (
      id INTEGER PRIMARY KEY,
      plantId INTEGER,
      accessoryId INTEGER,
      userId INTEGER,
      orderDate TEXT,
      quantity INTEGER,
      billAmount REAL
    )
  ''');
  }
}
