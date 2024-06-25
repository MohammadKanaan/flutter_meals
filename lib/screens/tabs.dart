import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/providers.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorites_screen.dart';
import 'package:meals/widgets/custom_drawer.dart';

class Tabs extends HookConsumerWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget activePage = const CategoriesScreen();
    var selectedPageIndex = ref.watch(activeScreenProvider);
    var activePageTitle = useState('Categories');

    if (selectedPageIndex == 1) {
      activePage = const FavoritesScreen();
      activePageTitle.value = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        selectedFontSize: 14,
        onTap: (index) {
          ref.read(activeScreenProvider.notifier).setActiveScreen(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: selectedPageIndex == 0
                  ? const Icon(Icons.restaurant_menu)
                  : const Icon(Icons.restaurant_menu_rounded),
              label: 'Meals'),
          BottomNavigationBarItem(
              icon: selectedPageIndex == 1
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
