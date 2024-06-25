import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/models/category.dart';
import 'package:meals/providers.dart';
import 'package:meals/screens/meals_screen.dart';

class CategoryGridItem extends HookConsumerWidget {
  const CategoryGridItem({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        var categoryProvider = ref.watch(selectedCategoryProvider.notifier);
        categoryProvider.setCategroy(category);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const MealsScreen(title: '', meals: []),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
