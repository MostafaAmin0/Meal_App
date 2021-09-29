import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/' :(ctx)=> TabsScreen(),
        CategoryMeals.route: (ctx) => CategoryMeals(),
        MealDetail.route : (ctx) => MealDetail(),
      },
      // home: CategoriesScreen(),

      onGenerateRoute: (settings){
        // ignore: avoid_print
        print(settings.name);
        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen()); 
      },

      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      },

    );
  }
}
