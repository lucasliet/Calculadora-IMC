import 'package:flutter/material.dart';
import '../components/custom_card.dart';
import '../components/result_stats.dart';
import '../components/bottom_button.dart';
import '../theme.dart';
import '../model/services/calc_service.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, Object> args = ModalRoute.of(context)!.settings.arguments as Map<dynamic, Object>;
    CalcService calc = CalcService(
        height: args['height'] as double?,
        weight: args['weight'] as int?
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
                    statsResult: calc.stats()['statsResult'] as String?,
                    statsColor: calc.stats()['statsColor'] as Color?,
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
