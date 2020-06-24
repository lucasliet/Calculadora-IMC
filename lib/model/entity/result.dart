import 'package:flutter/material.dart';

class Result {
  final int id;
  final double bmi;
  final String date;

  Result({
    this.id,
    @required this.bmi,
    @required this.date,
  });

  factory Result.fromMap(Map<String, dynamic> data) => new Result(
    id: data["id"],
    bmi: data["bmi"],
    date: data["date"],
  );

  Map toMap() {
    Map<String, dynamic> parsedMap = {
      'bmi': bmi,
      'date': date,
    };
    if(id != null) {
      parsedMap['id'] = id;
    }
    return parsedMap;
  }

  @override
  String toString() {
    return
      '\nResult{\n'
          'id: $id, \n'
          'bmi: $bmi, \n'
          'date: $date \n'
      '}';
  }
}

