import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'screen': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Fav',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title'] as String),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            ///for type [shifted]
            backgroundColor: Theme.of(context).colorScheme.primary,

            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            /// for type [shifted]
            backgroundColor: Theme.of(context).colorScheme.primary,

            icon: const Icon(Icons.star),
            label: 'Favorite',
          )
        ],
      ),
      body: _pages[_selectedIndex]['screen'] as Widget,
      drawer: const MainDrawer(),
    );
  }
}
