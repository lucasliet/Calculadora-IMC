import 'dart:async';

import 'package:calculadora_imc/model/entity/result.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ResultDAO {
  Database db;

  void createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'results.db');

    db = await openDatabase(dbPath, version: 1, onCreate: populateDb);
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE result ("
        "id INTEGER PRIMARY KEY,"
        "result INTEGER,"
        "date DATE,"
        ")");
  }

  Future<int> createResult(Database database, Result result) async {
    int dbAnswer = await database.insert("result", result.toMap());
    return dbAnswer;
  }

  Future<List> getResults() async {
    var dbAnswer = await db.query(
        "result", columns: ["id", "result", "date"]
    );
    return dbAnswer.toList();
  }

  Future<Result> getResult(int id) async {
    List<Map> dbAnswer = await db.query("result",
        columns: ["id", "result", "date"],
        where: 'id = ?',
        whereArgs: [id]);

    if (dbAnswer.length > 0) {
      return new Result.fromMap(dbAnswer.first);
    }
    return null;
  }

  Future<int> deleteResult(int id) async {
    return await db.delete("result", where: 'id = ?', whereArgs: [id]);
  }
}