import 'package:all_meals/all_Models/meal.dart';
import 'package:all_meals/dummy_data.dart';
import 'package:all_meals/screens/details.dart';
import 'package:all_meals/screens/filters.dart';
import 'package:all_meals/screens/tabs.dart';

import 'screens/mealsScreen.dart';
import 'package:all_meals/screens/catalog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availMeals = DUMMY_MEALS;
  List<Meal> _favoMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegeterian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavo(String mealId) {
    final availIndx = _favoMeals.indexWhere((meal) => meal.id == mealId);
    if (availIndx >= 0) {
      setState(() {
        _favoMeals.removeAt(availIndx);
      });
    } else {
      setState(() {
        _favoMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
  bool _isMealFavo(String id){
    return _favoMeals.any((meal) =>meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALL + MEALS',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.lightGreen,
        canvasColor: Color.fromRGBO(221, 210, 190, 0.6),
      ),
      routes: {
        '/': (con) => Tabs(_favoMeals),
        Filters.routname3: (con) => Filters(_filters, _setFilter),
        MealsScreen.route1: (con) => MealsScreen(_availMeals),
        Details.route2: (con) => Details(_toggleFavo,_isMealFavo),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (con) => MealsScreen(_availMeals));
      },
    );
  }
}
