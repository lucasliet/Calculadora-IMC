import 'package:flutter/material.dart';

class Result {
  final int id;
  final double result;
  final String date;

  Result({
    this.id,
    @required this.result,
    @required this.date,
  });

  factory Result.fromMap(Map<String, dynamic> data) => new Result(
    id: data["id"],
    result: data["result"],
    date: data["date"],
  );

  Map toMap() {
    Map<String, dynamic> parsedMap = {
      'result': result,
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
          'result: $result, \n'
          'date: $date \n'
      '}';
  }
}

