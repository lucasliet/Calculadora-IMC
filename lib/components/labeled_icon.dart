import 'package:flutter/material.dart';
import '../theme.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconLabel({@required this.icon, @required this.label});

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
          child: Text(label, style: labelStyle),
        ),
      ],
    );
  }
}
