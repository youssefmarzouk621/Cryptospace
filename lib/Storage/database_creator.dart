import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database dataB;

class DatabaseCreator {
  static const UsersTable = 'Users';
  static const id = 'id';
  static const database_id = '_id';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const email = 'email';
  static const password = 'password';
  static const phone = 'phone';
  static const token = 'token';
  static const publickey = 'publickey';
  static const pincode = 'pincode';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult, List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createUsersTable(Database db) async {
    print("create table users");
    final UsersSql = '''CREATE TABLE $UsersTable
    (
      "$id" INTEGER PRIMARY KEY,
      "$database_id" TEXT,
      "$firstName" TEXT,
      "$lastName" TEXT,
      "$email" TEXT,
      "$password" TEXT,
      "$phone" TEXT,
      "$token" TEXT,
      "$publickey" TEXT,
      "$pincode" TEXT
    )''';

    await db.execute(UsersSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('Vault_db');
    dataB = await openDatabase(path, version: 1, onCreate: onCreate);
    print("database init success");
  }

  Future<void> onCreate(Database db, int version) async {
    await createUsersTable(db);
  }
}
