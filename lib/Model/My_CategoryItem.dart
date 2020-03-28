import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FoodCategory.dart';

class My_CategoryItem extends StatelessWidget {
  final String id;
  final Color color;
  final String Title;

  My_CategoryItem(this.id, this.color, this.Title);
  void Category_select(BuildContext context) {
    Navigator.of(context).pushNamed(FoodCategory.Routename,
        arguments: {'id': id, 'title': Title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Category_select(context),
      splashColor: Colors.black38,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(Title),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
