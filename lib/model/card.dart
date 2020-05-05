import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  const CustomCard(
      {@required this.color, this.child, this.onPress}
    );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}