import 'package:flutter/cupertino.dart';

enum Complex { simple, Challenging, Hard }

enum Affordability { Affordable, pricey, Luxurious }

class Meal {
  final String id;
  final List<String> catas;
  final String title;
  final String imageurl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complex complexity;
  final Affordability affordable;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;

  final bool isVegeterian;

  const Meal(
      {@required this.id,
      @required this.catas,
      @required this.title,
      @required this.imageurl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordable,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegeterian});
}
