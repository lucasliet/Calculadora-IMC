import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(IMCapp());

//THEME
const cardColor         = Color(0xFF1D1E33);
const backgroundColor   = Color(0xFF0A0E21);
const accentColor       = Color(0xFF00B8D4);
const activeColor       = Color(0xFF388E3C);
const bottomButtomColor = Color(0xFFEB1555);
const numberStyle       = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
const labelStyle        = TextStyle(fontSize: 14);

class IMCapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor:            backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        accentColor:             accentColor,
      ),
      home: InputPage()
    );
  }
}