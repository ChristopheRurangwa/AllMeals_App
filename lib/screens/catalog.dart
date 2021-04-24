import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/CatItems.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(12),
        children: DUMMY_CATEGORIES
            .map((elem) => CatItems(elem.color, elem.name,elem.id),)
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 21,
            mainAxisSpacing: 21),
      );

  }
}
