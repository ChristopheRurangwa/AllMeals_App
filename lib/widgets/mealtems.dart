import 'package:all_meals/all_Models/meal.dart';
import 'package:all_meals/screens/details.dart';
import 'package:flutter/material.dart';

class MealItems extends StatelessWidget {
  final String title;
  final String imageURL;
  final Complex comple;
  final int duration;
  final Affordability afford;
  final String id;
  final Function removeItem;

  MealItems(
      {@required this.id,
      @required this.title,
      @required this.imageURL,
      @required this.comple,
      @required this.duration,
      @required this.afford,
      @required this.removeItem});

  String get affordabi {
    switch (afford) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  String get complexiTex {
    switch (comple) {
      case Complex.simple:
        return "Simple";
        break;
      case Complex.Challenging:
        return "Challenging";
        break;
      case Complex.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(Details.route2, arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 14,
                  child: Container(
                    width: 320,
                    color: Colors.black38,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.7, horizontal: 5.2),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [Icon(Icons.schedule), Text('${duration} min')],
                  ),
                  Row(
                    children: [Icon(Icons.work), Text(complexiTex)],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money_off_csred_outlined),
                      Text(affordabi)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
