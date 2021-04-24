import 'package:flutter/material.dart';

class Drawer1 extends StatelessWidget {
  Widget buildLisTileWidget(
      String titl, IconData iconData, Function switcScreen) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 28,
      ),
      title: Text(
        '$titl',
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
      onTap: switcScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(21),
          alignment: Alignment.centerLeft,
          child: Center(
            child: Text(
              'Set Table',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 21,
        ),
        buildLisTileWidget('Meal', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildLisTileWidget('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed('/filters');
        }),
      ],
    ));
  }
}
