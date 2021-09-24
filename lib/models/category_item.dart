import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category,{Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(child: Text(category.title)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.7),
            category.color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
