import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../theme.dart';

class ResultStats extends StatelessWidget {
  final String bmi;
  final String statsResult;
  final Color statsColor;
  final String recommendations;

  const ResultStats({
    @required this.bmi,
    @required this.statsResult,
    @required this.statsColor,
    @required this.recommendations,
  });

  recuperarBancoDados() async {
    // ATIVA BANCO DE DADOS

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(
        //abre e cria o banco de dados
        localBancoDados,
        version: 1, onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE results (id INTEGER PRIMARY KEY AUTOINCREMENT, result INTEGER, date DATE )";
      db.execute(sql);
    });

    //print("aberto: " + bd.isOpen.toString());
    return bd;
  }

  salvar({result, date}) async {
    Database bd = await recuperarBancoDados(); //acessa o banco criado

    Map<String, dynamic> insertResult = {
      "result": result,
      "date": date,
    };
    int id = await bd.insert("results", insertResult); //sempre retonra o id
    print("Salvo: $id");
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("pt_BR");
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          statsResult,
          style: TextStyle(
            fontSize: 25,
            color: statsColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          bmi,
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w900,
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'Índice IMC saudável:',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
            Text(
              '18,5 - 25kg/m2',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            recommendations,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        FlatButton(
          color: accentColor,
          onPressed: () async {
            var _dateFormatter = DateFormat('dd/MM/yyyy', 'pt_BR');
            var _date = DateTime.now();
            var _parsedDate = _dateFormatter.format(_date);

            salvar(result: bmi, date: _parsedDate);
          },
          child: Text(
            'Salvar',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
