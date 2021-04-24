import 'package:all_meals/all_Models/meal.dart';
import 'package:all_meals/widgets/mealtems.dart';
import 'package:flutter/material.dart';

class Favo extends StatelessWidget {
  final List<Meal> favmls;
  Favo(this.favmls);

  @override
  Widget build(BuildContext context) {
    if(favmls.isEmpty){
    return Center(child: Text('No Favorites selected'),);
  }
    else {
      return ListView.builder(
        itemBuilder: (con, inde) {
          return MealItems(
            id: favmls[inde].id,
            title: favmls[inde].title,
            imageURL: favmls[inde].imageurl,
            comple: favmls[inde].complexity,
            duration: favmls[inde].duration,
            afford: favmls[inde].affordable,

          );
        },
        itemCount: favmls.length,
      );
    }
    }
}
