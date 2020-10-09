import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Future initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database/wordsDB.db");

    final exist = await databaseExists(path);

    if (exist) {
      print("db exists!");
    } else {
      print("oops db does not exists");

    }
  }
}
