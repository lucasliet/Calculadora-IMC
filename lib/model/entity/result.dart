import 'package:flutter/material.dart';

class Result {
  final int id;
  final String result;
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

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'result': result,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'Result{id: $id, result: $result, date: $date}';
  }

}

