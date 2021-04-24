import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/mealsScreen.dart';

class CatItems extends StatelessWidget {
  final String title;
  final Color color;
  final String catId;

  CatItems(this.color, this.title, this.catId);

  void catScrn(BuildContext cont) {
    Navigator.of(cont)
        .pushNamed(MealsScreen.route1, arguments: {'id': catId, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => catScrn(context),
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(17),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.alice(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white60),
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.9), offset: Offset(1, 3))
          ],
          gradient: LinearGradient(
              colors: [color.withOpacity(.34), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    );
  }
}
