
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static const databaseName = "countries";
  static const databaseVersion = 1;
  static const tableName = "countriesTable";
  static const colId = "countryId";
  static const colCountryName = "countryName";
  static const colCountryRegion = "countryRegion";
  static const colCountryFlagPngUrl = "countryFlagPngUrl";

  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async{
      await getExternalStorageDirectory().then((directory) async{
      String path = join(directory!.path, databaseName);
      return await openDatabase(path, version: databaseVersion, onCreate: _onCreate);
    });
  }

  Future _onCreate(Database db, int version) async{
    db.execute('''
      CREATE TABLE $tableName(
        $colId INTEGER PRIMARY KEY,
        $colCountryName TEXT NOT NULL,
        $colCountryRegion TEXT NOT NULL,
        $colCountryFlagPngUrl TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertCountries(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<int> updateCountries(Map<String, dynamic> row, int id) async{
    Database db = await instance.database;
    return await db.update(tableName, row, where: '$colId = ?', whereArgs: [id]);
  }

  Future<int> deleteCountry(int id) async{
    Database db = await instance.database;
    return await db.delete(tableName, where: '$colId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> retrieveCountries() async{
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future<int> clearDatabase() async{
    Database db = await instance.database;
    return await db.delete(tableName);
  }
}