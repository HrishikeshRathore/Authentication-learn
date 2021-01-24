import 'package:flutter/cupertino.dart';

class Person {
  final String name;
  final String age;
  final String id;

  Person({
    @required this.name,
    this.id,
    @required this.age,
  });
}
