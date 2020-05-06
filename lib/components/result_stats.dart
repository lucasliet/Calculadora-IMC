import 'package:flutter/material.dart';

class ResultStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'NORMAL',
          style: TextStyle(
            fontSize: 25,
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '20',
          style: TextStyle(
            fontSize: 90,
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
        Text(
          'Você está dentro do peso ;)',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
