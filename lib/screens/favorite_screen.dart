import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('you have no Favorite yet'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                favoriteMeals[index],
                // removeItem: _removeMeal,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
