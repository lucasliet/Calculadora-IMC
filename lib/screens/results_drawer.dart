import 'package:calculadora_imc/components/result_tile.dart';
import 'package:calculadora_imc/model/entity/result.dart';
import 'package:calculadora_imc/model/services/result_service.dart';
import 'package:calculadora_imc/theme.dart';
import 'package:flutter/material.dart';

class ResultsDrawer extends StatefulWidget {
  @override
  _ResultsDrawerState createState() => _ResultsDrawerState();
}

class _ResultsDrawerState extends State<ResultsDrawer> {
  ResultService service = new ResultService();
  List<Result> results = [];

  void _getResults() async {
    List<Result> response = await service.getResults();
    setState(() => results = response);
  }

  @override
  void initState() {
    super.initState();
    _getResults();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: cardColor,
              child: DrawerHeader(
                child: Text('Seus resultados', style: titleStyle),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: ResultTile(result: results[index]),
                    onLongPress: () {
                      service.deleteResult(results[index].id);
                      _getResults();
                    },
                  );
                },
                itemCount: results.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
