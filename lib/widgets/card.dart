import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget content;
  final Function onPress;

  const CustomCard(
      {@required this.color, this.content, @required this.onPress}
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
        child: content,
      ),
    );
  }
}
