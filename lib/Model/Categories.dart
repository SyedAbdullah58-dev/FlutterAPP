import 'package:dartpractice/Model/3.2%20dummy_data.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'My_CategoryItem.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((merafunction) => My_CategoryItem(
              merafunction.id, merafunction.color, merafunction.title))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
    ));
  }
}
