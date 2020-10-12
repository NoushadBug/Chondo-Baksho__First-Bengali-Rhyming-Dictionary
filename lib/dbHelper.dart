import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database db;
  Future initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database/wordsDB.db");

    final exist = await databaseExists(path);
    final valid = await isDatabase(path);
    if (exist && valid) {
      print("db exists!");
      await openDatabase(path, readOnly: true);
      // List<Map> list = await db.rawQuery('SELECT *');
      // print(list);
      print('list');

      // await db.execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    } else {
      print("oops db does not exists");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        ByteData data = await rootBundle.load(join("assets", "wordsDB"));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);
        print('db copied');
      }
      await openDatabase(path, readOnly: true);
    }
  }

  Future<bool> isDatabase(String path) async {
    bool isDatabase = false;
    try {
      db = await openReadOnlyDatabase(path);
      int version = await db.getVersion();
      if (version != null) {
        isDatabase = true;
        print("db is valid");
      }
    } catch (_) {print("db not valid. db is closing");} finally {
      
      
    }
    return isDatabase;
  }

  Future execution(String query) async {
    // print(db.rawQuery('SELECT * FROM "words"'));
    // List<Map> list = await db.query('SELECT * FROM "words"');
    print(query);
  }
}
