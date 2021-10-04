import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          Meal meal = favoriteMeals[index];
          return MealItem(meal: meal);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
