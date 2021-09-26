import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({Key? key}) : super(key: key);

  static const route = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final Category category =ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text(category.title),
      ),
    );
  }
}
