import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          Meal meal = Meal(
            id: categoryMeals[index].id,
            categories: categoryMeals[index].categories,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            ingredients: categoryMeals[index].ingredients,
            steps: categoryMeals[index].steps,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            isGlutenFree: categoryMeals[index].isGlutenFree,
            isLactoseFree: categoryMeals[index].isLactoseFree,
            isVegan: categoryMeals[index].isVegan,
            isVegetarian: categoryMeals[index].isVegetarian,
          );
          return MealItem(meal: meal);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
