import 'package:flutter/material.dart';
import '../theme.dart';

class CustomSlider extends StatelessWidget {
  final String label;
  final double height;
  final Slider child;

  const CustomSlider({
    @required this.child,
    @required this.label,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label, style: labelStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              height.toStringAsFixed(2),
              style: numberStyle,
            ),
            Text('m'),
          ],
        ),
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
              thumbColor: accentColor,
              overlayColor: activeColor.withAlpha(70),
              activeTrackColor: accentColor.withAlpha(90),
              inactiveTrackColor: Colors.grey,
            ),
            child: child),
      ],
    );
  }
}
