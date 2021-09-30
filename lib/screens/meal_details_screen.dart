import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-details';

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, 'Ingridients'),
              ...meal.ingredients.map((ing) {
                return Container(
                  child: Text(
                    ing,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  margin: const EdgeInsets.all(5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  // height: 50,
                );
              }).toList(),
              _buildSectionTitle(context, 'Steps'),
              ...meal.steps.map((step) {
                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(
                              '# ${++counter}',
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(step),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              }).toList(),
            ],
          ),
        ));
  }
}
