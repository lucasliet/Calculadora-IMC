import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../components/card.dart';
import '../theme.dart';

class ResultsDrawer extends StatefulWidget {

  @override
  _ResultsDrawerState createState() => _ResultsDrawerState();
}

class _ResultsDrawerState extends State<ResultsDrawer> {
  List results= [];

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

  resultList() async{
    Database bd = await recuperarBancoDados(); //acessa o banco criado

    String sql = "SELECT * FROM results"; // Limita a quantidade de registros
    List results = await bd.rawQuery(sql); //retorna uma lista

    for (var result in results ){
      print(
          " id: " + result["id"].toString() +
          " resultado: " + result["result"].toString() +
          " data: " + result["date"].toString()
      );
    }
    return results;
  }

  @override
  void initState() {
    results = resultList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: cardColor,
              child: DrawerHeader(
                child: Text('Seus resultados', style: titleStyle),
              ),
            ),
            CustomCard(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Data'),
                        Text('06/04/2020', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Resultado'),
                        Text('18', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            CustomCard(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Data'),
                        Text('06/04/2020', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Resultado'),
                        Text('18', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
