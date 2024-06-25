import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class DetailedMealScreen extends StatelessWidget {
  const DetailedMealScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: ListView(
        children: [
          Hero(
            tag: meal.id,
            child: Image.network(meal.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '• ${meal.ingredients.join('\n• ')}',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Steps',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '• ${meal.steps.join('\n• ')}',
                    style: const TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
