
import 'package:block_structure/data/util/util.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBHelper {
  static Database? _database;

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'git_repo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE git_repo(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            data TEXT
          )
        ''');
      },
    );
  }

  static Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  static Future<void> saveRepoData(String jsonData) async {
    final db = await database;
    await db.delete('git_repo'); // clear old cache
    await db.insert('git_repo', {'data': jsonData});
  }

  static Future<String?> getRepoData() async {
    final db = await database;
    final result = await db.query('git_repo');

    printX("local database: ${result.first['data']}");

    if (result.isNotEmpty) {
      return result.first['data'] as String;
    }
    return null;
  }
}
