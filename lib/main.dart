import 'package:flutter/material.dart';
import 'package:flutter/services.dart' ;
import 'routes.dart';
import 'theme.dart';

void main() => runApp(IMCapp());

class IMCapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
