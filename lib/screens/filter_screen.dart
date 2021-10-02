import 'package:flutter/material.dart';
import 'package:meal_app/models/filters.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(this.filters,this.saveFilters, {Key? key}) : super(key: key);

  static const route = '/filter-screen';
  final Function(Filters) saveFilters;
  final Filters filters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _isGlutenFree;
  late bool _isVegan ;
  late bool _isVegetarian ;
  late bool _isLactoseFree ;

  @override
  void initState() {
    super.initState();
    _isGlutenFree=widget.filters.gluten;
    _isVegan=widget.filters.vegan;
    _isLactoseFree=widget.filters.lactose;
    _isVegetarian=widget.filters.vegetarian;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your Meals',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitch(
                context,
                _isGlutenFree,
                'Gluten',
                (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                },
              ),
              buildSwitch(
                context,
                _isVegetarian,
                'Vegetarian',
                (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
              buildSwitch(
                context,
                _isVegan,
                'Vegan',
                (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                },
              ),
              buildSwitch(
                context,
                _isLactoseFree,
                'Lactose',
                (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: const MainDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () { widget.saveFilters(
          Filters(
            gluten: _isGlutenFree,
            vegan: _isVegan,
            vegetarian: _isVegetarian,
            lactose: _isLactoseFree,
          ),
        );
        Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  SwitchListTile buildSwitch(
      BuildContext context, bool isActive, String title, Function changeState) {
    return SwitchListTile(
      value: isActive,
      activeColor: Theme.of(context).colorScheme.primary,
      activeTrackColor: Colors.pink[200],
      title: Text('$title-Free'),
      subtitle: Text('Only include $title free meals'),
      onChanged: (newValue) {
        changeState(newValue);
      },
    );
  }
}
