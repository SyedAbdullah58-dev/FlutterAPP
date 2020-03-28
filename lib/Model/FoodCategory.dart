import 'package:dartpractice/Model/Food.dart';

import 'FoodItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FoodItem.dart';

class FoodCategory extends StatefulWidget {
//  final String categoryId;
//  final String Categorytitle;
//
//  FoodCategory(this.categoryId, this.Categorytitle);
  static const Routename = "/Food-Category";
  final List availableFood;

  FoodCategory(this.availableFood);

  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  String categorytitle;

  List<Food> displayedFood;

  @override
  Widget build(BuildContext context) {
    final Routemap =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = Routemap['id'];
    categorytitle = Routemap['title'];
    final displayedFood = widget.availableFood.where((food) {
      return food.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          print("HEllo bawa$index");
          print(displayedFood[index].title);
          return FoodItem(
            id: displayedFood[index].id,
            title: displayedFood[index].title,
            imageURl: displayedFood[index].imageUrl,
            complexity: displayedFood[index].complexity,
            affordability: displayedFood[index].affordablitiy,
            duration: displayedFood[index].duration.toString(),
          );
        },
        itemCount: displayedFood.length,
      ),
    );
  }
}
