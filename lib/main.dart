import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MealsApp());
}

class MealsApp extends StatefulWidget {
  const MealsApp({Key? key}) : super(key: key);

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    final index = _favoriteMeals.indexWhere((element) => element.id == meal.id);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.any((element) => element.id == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = ThemeData(
      primarySwatch: Colors.pink,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: Colors.amber,
          ),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: Colors.pink,
          ),
      canvasColor: const Color.fromRGBO(255, 254, 245, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            headline5: const TextStyle(
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
              color: Colors.white,
            ),
          ),
    );

    return MaterialApp(
      title: 'DeliMeals',
      theme: _themeData,
      //home: const TabsScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
              isFavorite: _isFavorite,
              toggleFavorite: _toggleFavorite,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              setFilters: _setFilters,
              filters: _filters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategoryMealsScreen(
                  availableMeals: _availableMeals,
                ));
      },
    );
  }
}
