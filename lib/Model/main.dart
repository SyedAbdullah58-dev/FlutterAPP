import 'package:dartpractice/Model/3.2%20dummy_data.dart.dart';
import 'package:dartpractice/Model/Categories.dart';
import 'package:dartpractice/Model/Favourites.dart';
import 'package:dartpractice/Model/Filters.dart';
import 'package:dartpractice/Model/Food.dart';
import 'package:dartpractice/Model/FoodCategory.dart';
import 'package:dartpractice/Model/Food_Detail.dart';
import 'package:dartpractice/Model/MyTab.dart';
import 'package:flutter/material.dart';
import 'MyTab.dart';
import 'Filters.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'Vegetarian': false,
  };
  void TooggleFood(String mealid) {
    final existingindex = FavoriteFood.indexWhere((meal) => meal.id == mealid)
    if (existingindex >= 0) {;
      setState(() {
        FavoriteFood.removeAt(existingindex);
      });
    } else {
      setState(() {
        FavoriteFood.add(DUMMY_Food.firstWhere((MEAL) => MEAL.id == mealid));
      });
    }
  }

  bool _isFoodFav(String id) {
    return FavoriteFood.any((meal) => meal.id == id);
  }

  List<Food> AvailableMeals = DUMMY_Food;
  List<Food> FavoriteFood = [];
  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      AvailableMeals = DUMMY_Food.where((meal) {
        if (filters['gluten'] && meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && meal.isVegan) {
          return false;
        }
        if (filters['Vegetarian'] && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFood',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
            )),
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/': (context) => MyTab(FavoriteFood),
        FoodCategory.Routename: (context) => FoodCategory(AvailableMeals),
        Food_Detail.DetailRoute: (context) =>
            Food_Detail(TooggleFood, _isFoodFav),
        Filters.RouteFilter: (context) => Filters(filters, setFilters)
      },
    );
  }
}
