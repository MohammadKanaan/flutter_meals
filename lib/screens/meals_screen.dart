import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers.dart';

class MealsScreen extends HookConsumerWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedCategory = ref.watch(selectedCategoryProvider);
    final meals = dummyMeals
        .where((meal) => meal.categories.contains(selectedCategory.id))
        .toList();
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(meals[index].title),
        );
      },
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory.title),
      ),
      body: content,
    );
  }
}
