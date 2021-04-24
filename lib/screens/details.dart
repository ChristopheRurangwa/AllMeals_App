import 'package:all_meals/dummy_data.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  static const route2 = '/details';
  final Function toggleFavo;
  final Function isFav;
  Details(this.toggleFavo, this.isFav);

  Widget _ingred(BuildContext context, String titre) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Text(
        titre,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget kid) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        height: 300,
        width: 400,
        child: kid);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final chosenMeal = DUMMY_MEALS.firstWhere((elem) => elem.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${chosenMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 301,
              width: double.infinity,
              child: Image.network(
                chosenMeal.imageurl,
                fit: BoxFit.cover,
              ),
            ),
            _ingred(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(child: Text(chosenMeal.ingredients[index])),
                  ),
                ),
                itemCount: chosenMeal.ingredients.length,
              ),
            ),
            _ingred(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(chosenMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: chosenMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFav(mealId) ? Icons.favorite : Icons.favorite_border_sharp,
          color: Colors.redAccent,
        ),
        onPressed: () => toggleFavo(mealId),
      ),
    );
  }
}
