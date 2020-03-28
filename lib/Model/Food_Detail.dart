import 'package:dartpractice/Model/3.2%20dummy_data.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Food_Detail extends StatelessWidget {
  final Function Togglefunction;
  final Function IsFav;

  Food_Detail(this.Togglefunction, this.IsFav);

  static const DetailRoute = "/Food_Detail";
  Widget BuildSection(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "$text",
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget Build_Ingredients_Container({Widget child}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodID = ModalRoute.of(context).settings.arguments as String;
    final selectedfood = DUMMY_Food.firstWhere((food) => food.id == foodID);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedfood.title}"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Image.network(
                    selectedfood.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                BuildSection(context, "Ingredients"),
                Build_Ingredients_Container(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(selectedfood.ingredients[index])),
                    ),
                    itemCount: selectedfood.ingredients.length,
                  ),
                ),
                BuildSection(context, "Steps"),
                Build_Ingredients_Container(
                    child: ListView.builder(
                  itemBuilder: (context, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedfood.steps[index]),
                    ),
                    Divider()
                  ]),
                  itemCount: selectedfood.steps.length,
                ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(IsFav(foodID) ? Icons.star : Icons.star_border),
          onPressed: () => Togglefunction(foodID),
        ));
  }
}
