import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/providers.dart';

class FiltersScreen extends HookConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGlutenFree =
        ref.watch(filtersProvider.select((value) => value.isGlutenFree));
    final isLactoseFree =
        ref.watch(filtersProvider.select((value) => value.isLactoseFree));
    final isVegetarian =
        ref.watch(filtersProvider.select((value) => value.isVegetarian));
    final isVegan = ref.watch(filtersProvider.select((value) => value.isVegan));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          const Text('Filters'),
          SwitchListTile(
            value: isGlutenFree,
            onChanged: (newValue) {
              ref.watch(filtersProvider.notifier).setIsGlutenFree(newValue);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: const Text('Only include gluten-free meals.'),
          ),
          SwitchListTile(
            value: isLactoseFree,
            onChanged: (newValue) {
              ref.watch(filtersProvider.notifier).setIsLactoseFree(newValue);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: const Text('Only include lactose-free meals.'),
          ),
          SwitchListTile(
            value: isVegetarian,
            onChanged: (newValue) {
              ref.watch(filtersProvider.notifier).setIsVegetarian(newValue);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: const Text('Only include vegetarian meals.'),
          ),
          SwitchListTile(
            value: isVegan,
            onChanged: (newValue) {
              ref.watch(filtersProvider.notifier).setIsVegan(newValue);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: const Text('Only include vegan meals.'),
          ),
        ],
      ),
    );
  }
}
