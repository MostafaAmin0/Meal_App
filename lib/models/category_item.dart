import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, {Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(15);

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        CategoryMeals.route,
        arguments: category,
      ),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: radius,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: radius,
        ),
      ),
    );
  }
}
