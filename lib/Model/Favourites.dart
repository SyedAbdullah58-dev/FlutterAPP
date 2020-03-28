import 'package:dartpractice/Model/Food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FoodItem.dart';

class Favorites extends StatelessWidget {
  final List<Food> Myfavorite;
  Favorites(this.Myfavorite);

  @override
  Widget build(BuildContext context) {
    if (Myfavorite.isEmpty) {
      return Center(
        child: Text(
          "No Favorites yet! add Some 😉 ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          print("HEllo bawa$index");
          print(Myfavorite[index].title);
          return FoodItem(
            id: Myfavorite[index].id,
            title: Myfavorite[index].title,
            imageURl: Myfavorite[index].imageUrl,
            complexity: Myfavorite[index].complexity,
            affordability: Myfavorite[index].affordablitiy,
            duration: Myfavorite[index].duration.toString(),
          );
        },
        itemCount: Myfavorite.length,
      );
    }
  }
}
