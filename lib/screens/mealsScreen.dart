import 'package:all_meals/all_Models/meal.dart';
import 'package:all_meals/dummy_data.dart';
import 'package:all_meals/widgets/mealtems.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatefulWidget {
  static const String route1 = '/catalogs';
  final List<Meal> availableMeals;

  MealsScreen(this.availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String catTitle;
  List<Meal> disPlayedMeals;
  var _loadedInit = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInit) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catTitle = routeArgs['title'];
      final catId = routeArgs['id'];
      disPlayedMeals = widget.availableMeals.where((elem) {
        return elem.catas.contains(catId);
      }).toList();
      _loadedInit = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      disPlayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (con, inde) {
            return MealItems(
              id: disPlayedMeals[inde].id,
              title: disPlayedMeals[inde].title,
              imageURL: disPlayedMeals[inde].imageurl,
              comple: disPlayedMeals[inde].complexity,
              duration: disPlayedMeals[inde].duration,
              afford: disPlayedMeals[inde].affordable,
              removeItem: _removeMeal,
            );
          },
          itemCount: disPlayedMeals.length,
        ));
  }
}
