import 'package:flutter/material.dart';
import '../theme.dart';

class BottomButton extends StatelessWidget {
  final String route;
  final String label;

  const BottomButton({this.label, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Navigator.canPop(context)
          ? () => Navigator.pop(context)
          : () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: bottomButtonColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Center(child: Text(label, style: bottomButtonLabelStyle)),
        padding: EdgeInsets.only(bottom: 14),
      ),
    );
  }
}
