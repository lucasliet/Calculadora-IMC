import 'package:flutter/material.dart';
import 'dart:math';

class CalcService {
  final double height;
  final int weight;
  double _bmi;

  CalcService({@required this.height,@required this.weight});

  String calcIMC() {
    _bmi = weight / pow( height , 2 );
    return _bmi.toStringAsFixed(1);
  }

  Map<String, Object> stats() {
    if( _bmi >= 25 ){
      return {'statsResult': 'SOBREPESO', 'statsColor': Colors.red};
    } else if ( _bmi > 18.5 ){
      return {'statsResult': 'IDEAL', 'statsColor': Colors.green};
    } else {
      return {'statsResult': 'ABAIXO DO PESO', 'statsColor': Colors.red};
    }
  }

  String recommendations(){
    if( _bmi >= 25 ){
      return '''
      Você tem massa corpórea acima do normal.
      Levanta do sofá e vai fazer exercício!
      ''';
    } else if ( _bmi > 18.5 ){
      return 'Você está dentro do valor recomendado, Parabéns ;)';
    } else {
      return 'Você tem massa corpórea abaixo do normal. Vá comer :P';
    }
  }
}