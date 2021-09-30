import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MealsApp());
}

class MealsApp extends StatelessWidget {
  const MealsApp({Key? key}) : super(key: key);

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
          ),
    );

    return MaterialApp(
      title: 'DeliMeals',
      theme: _themeData,
      home: const TabsScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoryMealsScreen());
      },
    );
  }
}
