import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final _dbName = 'Vault.db';
  static final _dbVersion = 1;
  static final _tableName = 'Users';
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if(_database!=null){
      print("database existe");
    }else{
      print('database null so creating');
      _database = await _initiateDatabase();
      print('outside init database');
      return _database;
    }


  }

  _initiateDatabase() async {
    print("inside init database");
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);
  }

  Future _onCreate(Database db,int version){
    print('inside oncreate');
    db.execute(
        '''
        CREATE TABLE $_tableName(
          'id' INTEGER PRIMARY KEY,
          '_id' TEXT NOT NULL,
          'firstName' TEXT NOT NULL,
          'lastName' TEXT NOT NULL,
          'email' TEXT NOT NULL,
          'password' TEXT NOT NULL,
          'phone' TEXT NOT NULL )
        '''
    );
    print("table created");
  }

  Future<int> insert(Map<String,dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String,dynamic>>> getAll() async{
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future update(Map<String,dynamic> row) async{
   Database db = await instance.database;
   int id = row['_id'];
   return await db.update(_tableName, row,where: "'_id' = ?",whereArgs: [id]);
  }

  Future<int> delete(int id) async{
    Database db = await instance.database;
    return await db.delete(_tableName,where: "'_id' = ?",whereArgs: [id]);
  }

}