import 'package:flutter/material.dart';

import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  const CategoryMeals({Key? key}) : super(key: key);

  static const route = '/category-meals';

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  late Category category;
  late List<Meal> filteredMeals;

 
 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)!.settings.arguments as Category;

    filteredMeals = kDummyMeals.where(
      (meal) {
        return meal.myCategories.contains(category.id);
      },
    ).toList();
  }

  void _removeMeal(Meal meal) {
    setState(() {
      filteredMeals.remove(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            filteredMeals[index],
            removeItem: _removeMeal,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
