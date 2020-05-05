import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusMinusButtons extends StatelessWidget {
  final String label;
  final int number;
  final TextStyle labelTextStyle;
  final TextStyle numberStyle;
  final Color accentColor;
  final Function minusButton;
  final Function plusButton;
  final Color pressedButtonColor;

  PlusMinusButtons({
    @required this.label,
    @required this.number,
    @required this.numberStyle,
    @required this.labelTextStyle,
    @required this.accentColor,
    @required this.minusButton,
    @required this.plusButton,
    @required this.pressedButtonColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: labelTextStyle,
        ),
        Text(number.toString(), style: numberStyle),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RawMaterialButton(
                  elevation: 0.0,
                  child: const Icon(FontAwesomeIcons.minus),
                  onPressed: minusButton,
                  constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
                  shape: CircleBorder(),
                  fillColor: accentColor,
                  highlightColor: pressedButtonColor,
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  elevation: 0.0,
                  child: const Icon(FontAwesomeIcons.plus),
                  onPressed: plusButton,
                  constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
                  shape: CircleBorder(),
                  fillColor: accentColor,
                  highlightColor: pressedButtonColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
