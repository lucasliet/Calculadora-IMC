import 'package:flutter/material.dart';

class PlusMinus extends StatelessWidget {
  final String label;
  final int number;
  final TextStyle textStyle;

  PlusMinus({this.label, this.number, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          number.toString(),
          style: textStyle
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        )
      ],
    );
  }
}
