import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  static const routeName = '/';

  final List<Meal> favoriteMeals;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];

  int _selectedPageIndex = 0;

  @override
  initState() {
    super.initState();
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorites',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        titleTextStyle: Theme.of(context).textTheme.headline5,
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: 'Favorites',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
