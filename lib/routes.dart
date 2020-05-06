import 'package:flutter/widgets.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (context) => InputPage(),
  '/result': (context) => ResultPage()
};
