import 'dart:async';

import 'package:calculadora_imc/model/entity/result.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ResultDAO {
  Future<Database> init() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(databasesPath, "database.db");

    Database db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, int version){
        db.execute(
            '''
            CREATE TABLE results (
                  id INTEGER PRIMARY KEY AUTOINCREMENT, 
                  bmi DOUBLE, 
                  date DATE
            )
            '''
        );
    });
    return db;
  }

  Future<int> insert({required Database db, required Result result}) async {
    int insertedId = await db.insert("results", result.toMap() as Map<String, Object?>);
    return insertedId;
  }

  Future<List> getResults(Database db) async {
    List<Map> dbAnswer = await db.query("results");
    List<Result> results = [];
    for (Map result in dbAnswer) {
      results.add(Result.fromMap(result as Map<String, dynamic>));
    }
    return results;
  }

  Future<Result?> getResult({required Database db, int? id}) async {
    List<Map> dbAnswer = await db.query("results",
        columns: ["id", "bmi", "date"], where: 'id = ?', whereArgs: [id]);

    if (dbAnswer.length > 0) {
      return new Result.fromMap(dbAnswer.first as Map<String, dynamic>);
    }
    return null;
  }

  Future<int> deleteResult({required Database db, int? id}) async {
    return await db.delete("results", where: 'id = ?', whereArgs: [id]);
  }
}
