import 'package:dartpractice/Model/Categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main_Drawer extends StatelessWidget {
  Widget BuildTile(String title, IconData ic, Function tapper) {
    return ListTile(
      leading: Icon(
        ic,
        size: 26,
      ),
      title: Text(
        "$title",
        style: TextStyle(
            fontFamily: "RobotCondensed",
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapper,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking UP!",
              textScaleFactor: 1.5,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BuildTile("Food", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildTile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed("/filters");
          }),
        ],
      ),
    );
  }
}
