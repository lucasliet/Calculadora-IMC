import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget content;

  const CustomCard({@required this.color, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: content,
    );
  }
}
