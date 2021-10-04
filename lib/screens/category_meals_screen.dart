import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle = '';
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _loadedInitData = true;
  }

  void _removeMeal(Meal mealToRemove) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == mealToRemove.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
      itemBuilder: (ctx, index) {
        Meal meal = displayedMeals![index];
        return MealItem(meal: meal);
      },
      itemCount: displayedMeals!.length,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        titleTextStyle: Theme.of(context).textTheme.headline5,
      ),
      body: displayedMeals!.isEmpty
          ? const Center(
              child: Text('No items on the list!'),
            )
          : listView,
    );
  }
}
