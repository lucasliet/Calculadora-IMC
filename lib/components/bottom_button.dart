import 'package:flutter/material.dart';
import '../theme.dart';

class BottomButton extends StatelessWidget {
  final String route;
  final String label;
  final Map<String, Object> args;

  const BottomButton({
    @required this.label,
    @required this.route,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route, arguments: args),
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
