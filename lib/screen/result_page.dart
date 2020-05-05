import 'package:calculadora_imc/components/bottom_button.dart';
import 'package:flutter/material.dart';
import '../components/card.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Resultado"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('teste'),
                    Text('2134'),
                    Text('Índice IMC saudável:'),
                    Text('18,5 - 25kg/m2'),
                    Text('parabéns'),
                  ],
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
