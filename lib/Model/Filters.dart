import 'package:dartpractice/Model/Main_Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  static const String RouteFilter = "/filters";
  Map<String, bool> currentfilter;
  final Function savefilters;
  Filters(this.currentfilter, this.savefilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenfree = widget.currentfilter['gluten'];
    _lactoseFree = widget.currentfilter['lactose'];
    _vegetarian = widget.currentfilter['Vegetarian'];
    _vegan = widget.currentfilter['vegan'];
    super.initState();
  }

  Widget BuildSwitchListTile(
      String title, String description, bool currentval, Function Updateval) {
    return SwitchListTile(
      title: Text(
        "$title",
      ),
      value: currentval,
      subtitle: Text("$description"),
      onChanged: Updateval,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Save",
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.save,
              textDirection: TextDirection.rtl,
            ),
            tooltip: "Save",
            hoverColor: Colors.orange,
            onPressed: () {
              final SelectedOnes = {
                'gluten': _glutenfree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'Vegetarian': _vegetarian,
              };
              widget.savefilters(SelectedOnes);
            },
          )
        ],
        title: Text("Filters"),
      ),
      drawer: Main_Drawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Food selection.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                BuildSwitchListTile(
                    "Gluten Free", "only include Gluten free food", _glutenfree,
                    (newValue) {
                  setState(() {
                    print("_glutenfree $_glutenfree");
                    _glutenfree = newValue;
                    print("_glutenfree $_glutenfree");
                  });
                }),
                BuildSwitchListTile("Lactose-free",
                    "only include Lactose free food", _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                    print("_glutenfree $_lactoseFree");
                  });
                }),
                BuildSwitchListTile(
                    "Vegetarian", "only include Vegetarian food", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                    print("_glutenfree $_vegetarian");
                  });
                }),
                BuildSwitchListTile("Vegan", "only include vegan food", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                    print("_glutenfree $_vegan");
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
