import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextStyle labelTextStyle;

  IconLabel({@required this.icon, @required this.label, @required this.labelTextStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Icon(
            icon,
            size: 80,
          ),
        ),
        Expanded(
          child: Text(
            label,
            style: labelTextStyle
          ),
        ),
      ],
    );
  }
}
