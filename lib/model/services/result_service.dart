import 'package:calculadora_imc/model/dao/result_dao.dart';
import 'package:calculadora_imc/model/entity/result.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class ResultService {
  ResultDAO dao;

  ResultService() {
    this.dao = new ResultDAO();
  }

  void insert({String bmi}) async {
    Database db = await dao.init();

    DateFormat _dateFormatter = DateFormat('dd/MM/yyyy', 'pt_BR');
    DateTime _date = DateTime.now();
    String _parsedDate = _dateFormatter.format(_date);

    double _parsedBMI = double.tryParse(bmi) ?? 0.0;

    Result result = new Result(bmi: _parsedBMI, date: _parsedDate);
    print(result.toMap());
    await dao.insert(db: db,result: result);
    await db.close();
  }

  Future<List<Result>> getResults() async {
    Database db = await dao.init();
    List<Result> resultList = await dao.getResults(db);
    db.close();
    return resultList;
  }

  void deleteResult(int id) async {
    Database db = await dao.init();
    await dao.deleteResult(db: db, id: id);
    db.close();
  }
}
