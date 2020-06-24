import 'package:calculadora_imc/components/card.dart';
import 'package:calculadora_imc/model/entity/result.dart';
import 'package:calculadora_imc/model/services/result_service.dart';
import 'package:calculadora_imc/theme.dart';
import 'package:flutter/material.dart';

class ResultsDrawer extends StatefulWidget {
  @override
  _ResultsDrawerState createState() => _ResultsDrawerState();
}

class _ResultsDrawerState extends State<ResultsDrawer> {
  List<Result> results = [];

  void _getResults() async {
    ResultService service = new ResultService();
    List<Result> response = await service.getResults();
    setState(() => results = response);
    print(response);
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: cardColor,
              child: DrawerHeader(
                child: Text('Seus resultados', style: titleStyle),
              ),
            ),
            Container(
              height: double.maxFinite,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CustomCard(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Data'),
                              Text(results[index].date,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('Resultado'),
                              Text(results[index].result.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
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
