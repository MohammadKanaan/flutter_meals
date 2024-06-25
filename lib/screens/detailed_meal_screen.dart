import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers.dart';

class DetailedMealScreen extends HookConsumerWidget {
  const DetailedMealScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favouriteMeals = ref.watch(favoriteMealsProvider);
    var isFavourite = useState(favouriteMeals.contains(meal));
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: ListView(
        children: [
          Stack(children: [
            Hero(
              tag: meal.id,
              child: Image.network(meal.imageUrl),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: IconButton.filled(
                onPressed: () {
                  if (isFavourite.value) {
                    ref
                        .read(favoriteMealsProvider.notifier)
                        .removeFavoriteMeal(meal);
                  } else {
                    ref
                        .read(favoriteMealsProvider.notifier)
                        .addFavoriteMeal(meal);
                  }
                  isFavourite.value = !isFavourite.value;
                },
                icon: isFavourite.value
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
              ),
            )
          ]),
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
