import 'package:flutter_universe/Models/Core_User.dart';
import 'package:flutter_universe/Storage/database_creator.dart';

class UsersRepository {
  static Future<List<CoreUser>> getAllUsers() async {
    await DatabaseCreator().initDatabase();
    final sql = '''
      SELECT * FROM '${DatabaseCreator.UsersTable}'
    ''';
    final data = await db.rawQuery(sql);
    List<CoreUser> users = List();

    for (final node in data) {
      final user = CoreUser.fromJson(node);
      users.add(user);
    }
    return users;
  }

  static Future<int> getConnectedUser() async {
    await DatabaseCreator().initDatabase();
    final sql = '''
      SELECT * FROM '${DatabaseCreator.UsersTable}'
    ''';
    final data = await db.rawQuery(sql);
    return data.length;
  }

  static Future<CoreUser> getUser(int id) async {
    final sql = '''
      SELECT * FROM ${DatabaseCreator.UsersTable}
      WHERE "${DatabaseCreator.database_id}" = ?
    ''';

    List<dynamic> params = [id];

    final data = await db.rawQuery(sql, params);

    final user = CoreUser.fromJson(data.first);
    return user;
  }

  static Future<void> addUser(CoreUser user) async {

    final sql = '''INSERT INTO ${DatabaseCreator.UsersTable}
    (
      "${DatabaseCreator.id}",
      "${DatabaseCreator.database_id}",
      "${DatabaseCreator.firstName}",
      "${DatabaseCreator.lastName}",
      "${DatabaseCreator.email}",
      "${DatabaseCreator.password}",
      "${DatabaseCreator.phone}",
      "${DatabaseCreator.token}",
      "${DatabaseCreator.publickey}",
      "${DatabaseCreator.pincode}",
      "${DatabaseCreator.touchId}"
    )
    VALUES (?,?,?,?,?,?,?,?,?,?,?)''';
    List<dynamic> params = [user.id,user.database_id, user.firstName, user.lastName, user.email, user.password, user.phone, user.token, user.publickey, user.pincode, user.touchId];
    final result = await db.rawInsert(sql, params);

    DatabaseCreator.databaseLog('Add User', sql, null, result, params);
  }

  static Future<void> deleteUser(CoreUser user) async {

    final sql = '''DELETE FROM ${DatabaseCreator.UsersTable}
    WHERE "${DatabaseCreator.database_id}" = ?
    ''';

    List<dynamic> params = [user.database_id];
    final result = await db.rawDelete(sql, params);

    DatabaseCreator.databaseLog('Delete User', sql, null, result, params);
  }

  static Future<void> updateUser(CoreUser user) async {
    final sql = '''
    UPDATE ${DatabaseCreator.UsersTable}
    SET "${DatabaseCreator.firstName}" = ?, 
        "${DatabaseCreator.lastName}" = ?, 
        "${DatabaseCreator.email}" = ?,
        "${DatabaseCreator.password}" = ?,
        "${DatabaseCreator.phone}" = ?,
        "${DatabaseCreator.token}" = ?,
        "${DatabaseCreator.publickey}" = ?,
        "${DatabaseCreator.pincode}" = ?,
        "${DatabaseCreator.touchId}" = ?
    WHERE ${DatabaseCreator.database_id} = ?
    ''';

    List<dynamic> params = [user.firstName, user.lastName, user.email, user.password, user.phone, user.token, user.publickey, user.pincode, user.touchId, user.database_id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update user', sql, null, result, params);
  }

  static Future<int> usersCount() async {
    final data = await db.rawQuery('''
    SELECT COUNT(*) FROM ${DatabaseCreator.UsersTable}
    ''');
    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}