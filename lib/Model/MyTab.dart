import 'package:dartpractice/Model/Categories.dart';
import 'package:dartpractice/Model/Favourites.dart';
import 'package:dartpractice/Model/Food.dart';
import 'package:dartpractice/Model/Main_Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTab extends StatefulWidget {
  List<Food> Myfavs;
  List<Food> ISMyfavs;

  MyTab(this.Myfavs);

  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  List<Map<String, Object>> _pages;
  int _selectedPage_index = 0;

  @override
  void initState() {
    _pages = [
      {'page': Categories(), 'title': 'Food Monkey'},
      {'page': Favorites(widget.Myfavs), 'title': 'Favorites'}
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("yelo bhai  -- $_selectedPage_index");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Main_Drawer(),
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.fastfood,
                size: 28,
              ),
            )
          ],
          title: Text(_pages[_selectedPage_index]['title']),
        ),
        body: _pages[_selectedPage_index]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.grey,
          currentIndex: _selectedPage_index,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Favorites"),
            )
          ],
        ),
      ),
    );
  }
}
