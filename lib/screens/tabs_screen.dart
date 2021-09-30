import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = const [
    {
      'screen': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'screen': Center(child: Text('Fav')),
      'title': 'Your Fav',
    },
  ];

  int _selectedIndex = 0;

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
    );
  }
}
