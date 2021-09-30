import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Text('Sample ${meal.title}'),
      ),
    );
  }
}
