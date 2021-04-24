import 'package:all_meals/widgets/drawer1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Filters extends StatefulWidget {
  static const String routname3 = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters,this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState(){

    _glutenfree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegetarian=widget.currentFilters['vegetarian'];
    _vegan=widget.currentFilters['vegan'];

    super.initState();
  }

  Widget _buildSwitch(
      bool cuValue, String txt, String subTxt, Function update) {
    return SwitchListTile(
      title: Text(txt),
      value: cuValue,
      subtitle: Text(subTxt),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(icon: Icon(Icons.save_outlined), onPressed: (){

              final selectFilter={
                'gluten': _glutenfree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectFilter);



            }),
          ],
        ),
        drawer: Drawer1(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(21),
              child: Center(
                  child: Text(
                'Choose Your Meal',
                style: GoogleFonts.baloo(
                    fontWeight: FontWeight.bold, fontSize: 25),
              )),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitch(
                    _glutenfree,
                    'Gluten-Free',
                    'Only Include Gluten Free Meals',
                    (newVal) {
                      setState(() {
                        _glutenfree = newVal;
                      });
                    },
                  ),
                  _buildSwitch(
                    _lactoseFree,
                    'Lactose-Free',
                    'Only Include Lactose Free Meals',
                    (newVal) {
                      setState(() {
                        _lactoseFree = newVal;
                      });
                    },
                  ),
                  _buildSwitch(
                    _vegetarian,
                    'Vegetarian',
                    'Only Include Vegetarian Meals',
                    (newVal) {
                      setState(() {
                        _vegetarian = newVal;
                      });
                    },
                  ),
                  _buildSwitch(
                    _vegan,
                    'Vegan',
                    'Only Include Vegan Meals',
                    (newVal) {
                      setState(() {
                        _vegan = newVal;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
