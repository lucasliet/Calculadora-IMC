import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(IMCapp());

class IMCapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0a0E21),
        accentColor: Colors.pinkAccent
      ),
      home: InputPage()
    );
  }
}
