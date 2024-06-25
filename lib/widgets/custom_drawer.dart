import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/providers.dart';
import 'package:meals/screens/filters_screen.dart';

class CustomDrawer extends HookConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        AppBar(
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant_menu),
          title: const Text('Meals'),
          onTap: () {
            ref.read(activeScreenProvider.notifier).setActiveScreen(0);
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.toggle_on),
          title: const Text('Filters'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FiltersScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
