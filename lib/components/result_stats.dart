import 'package:calculadora_imc/model/services/result_service.dart';
import 'package:calculadora_imc/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

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
            ResultService service = new ResultService();
            service.insert(bmi: bmi);
            print(await service.getResults());
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
