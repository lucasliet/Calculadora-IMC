import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';

void main() => runApp(IMCapp());

class IMCapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        accentColor: accentColor,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
