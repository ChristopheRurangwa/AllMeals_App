import 'package:flutter/material.dart';

class Cat {
  final String id;
  final String name;
  final Color color;
  const Cat(
      {@required this.id,
      this.color = Colors.lightGreenAccent,
      @required this.name});
}
