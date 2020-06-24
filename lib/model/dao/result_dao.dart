import 'dart:async';

import 'package:calculadora_imc/model/entity/result.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ResultDAO {
  Database db;
  Future<Database> createDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String dbPath = join(databasesPath, 'results.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database database, int version) {
        database.execute("CREATE TABLE results (id INTEGER PRIMARY KEY AUTOINCREMENT, result INTEGER, date DATE )");
      },
    );
  }

  Future<int> createResult({result, date}) async {
    Database bd = await createDatabase();
    Map<String, dynamic> insertResult = {"result": result, "date": date};
    int dbAnswer = await bd.insert("results", insertResult);
    return dbAnswer;
  }

  Future<List> getResults() async {
    var dbAnswer = await db.query("results", columns: ["id", "result", "date"]);
    return dbAnswer.toList();
  }

  Future<Result> getResult(int id) async {
    List<Map> dbAnswer = await db.query("results",
        columns: ["id", "result", "date"], where: 'id = ?', whereArgs: [id]);

    if (dbAnswer.length > 0) {
      return new Result.fromMap(dbAnswer.first);
    }
    return null;
  }

  Future<int> deleteResult(int id) async {
    return await db.delete("results", where: 'id = ?', whereArgs: [id]);
  }
}
