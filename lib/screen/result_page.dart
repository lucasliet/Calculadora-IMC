import 'package:calculadora_imc/components/bottom_button.dart';
import 'package:flutter/material.dart';
import '../components/card.dart';
import '../components/result_stats.dart';
import '../theme.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  child: ResultStats()
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
