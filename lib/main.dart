import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'models/filters.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters =
      Filters(gluten: false, vegan: false, vegetarian: false, lactose: false);

  List<Meal> _availableMeals = kDummyMeals;
  List<Meal> _favoriteMeals = [];

  void _saveFilters(Filters newFilters) {
    setState(() {
      _filters = newFilters;

      _availableMeals = kDummyMeals.where((element) {
        if ((_filters.gluten && !element.isGlutenFree) ||
            (_filters.lactose && !element.isLactoseFree) ||
            (_filters.vegan && !element.isVegan) ||
            (_filters.vegetarian && !element.isVegetarian)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _togglefavorite(Meal meal) {
    final index = _favoriteMeals.indexOf(meal);
    setState(() {
      if (index == -1) {
        _favoriteMeals.add(meal);
      } else {
        _favoriteMeals.removeAt(index);
      }
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMeals.route: (ctx) => CategoryMeals(_availableMeals),
        MealDetail.route: (ctx) => MealDetail(_togglefavorite,_isFavorite),
        FilterScreen.route: (ctx) => FilterScreen(_filters, _saveFilters),
      },
      // home: CategoriesScreen(),

      onGenerateRoute: (settings) {
        // ignore: avoid_print
        print(settings.name);
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
