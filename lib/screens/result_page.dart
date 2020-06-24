import 'package:flutter/material.dart';
import '../components/custom_card.dart';
import '../components/result_stats.dart';
import '../components/bottom_button.dart';
import '../theme.dart';
import '../model/services/calc_service.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, Object> args = ModalRoute.of(context).settings.arguments;
    CalcService calc = CalcService(
        height: args['height'],
        weight: args['weight']
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Resultado", style: titleStyle),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomCard(
                  child: ResultStats(
                    bmi: calc.calcIMC(),
                    statsResult: calc.stats()['statsResult'],
                    statsColor: calc.stats()['statsColor'],
                    recommendations: calc.recommendations(),
                  )
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                label: 'RECALCULAR',
                route: '/',
              ),
            )
          ],
        ),
      ),
    );
  }
}
