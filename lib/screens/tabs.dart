import 'package:all_meals/all_Models/meal.dart';
import 'package:all_meals/screens/catalog.dart';
import 'package:all_meals/screens/favo.dart';
import 'package:all_meals/widgets/drawer1.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favMeals;

Tabs(this.favMeals);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
   List<Map<String, dynamic>> _pgs;
  int _selectd = 0;

  @override
  void initState() {
   _pgs=[
     {'page': Catalog(), 'title': 'Categories'},
     {'page': Favo(widget.favMeals), 'title': 'Favorites'}
   ];
    super.initState();
  }

  void _selecPg(int index) {
    setState(() {
      _selectd = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pgs[_selectd]['title']),
      ),
      drawer: Drawer1(),
      body: _pgs[_selectd]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selecPg,
        backgroundColor: Colors.orangeAccent,
        unselectedItemColor: Colors.pink,
        selectedItemColor: Colors.green,
        currentIndex: _selectd,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              'Categories',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.favorite_border_sharp,
            ),
            title: Text(
              'Favorites',
            ),
          )
        ],
      ),
    );
  }
}
