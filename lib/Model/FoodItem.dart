import 'package:dartpractice/Model/Food.dart';
import 'package:dartpractice/Model/Food_Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Food.dart';

class FoodItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURl;
  final String duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeFood;

  FoodItem(
      {@required this.id,
      this.title,
      this.imageURl,
      this.duration,
      this.complexity,
      this.affordability,
      this.removeFood});

  String get ComplexityText {
    if (complexity == Complexity.Simple) {
      return "Simple";
    } else if (complexity == Complexity.Hard) {
      return "Hard";
    } else if (complexity == Complexity.Challenge) {
      return "Challenging";
    } else {
      return "unknown";
    }
  }

  String get Affordabil {
    if (affordability == Affordability.Affordable) {
      return "Affordable";
    } else if (affordability == Affordability.Luxurious) {
      return "Luxurious";
    } else if (affordability == Affordability.Pricey) {
      return "Pricy";
    } else {
      return "unknown";
    }
  }

  void selectFood(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      Food_Detail.DetailRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeFood(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("apnatime$duration");

    return InkWell(
      onTap: () => selectFood(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageURl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text(" $duration min")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$ComplexityText")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$Affordabil")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
