import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorites_screen.dart';

class Tabs extends HookConsumerWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget activePage = const CategoriesScreen();
    var selectedPageIndex = useState(0);
    var activePageTitle = useState('Categories');

    if (selectedPageIndex.value == 1) {
      activePage = const FavoritesScreen();
      activePageTitle.value = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex.value,
        selectedFontSize: 14,
        onTap: (index) {
          selectedPageIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
              icon: selectedPageIndex.value == 0
                  ? const Icon(Icons.category)
                  : const Icon(Icons.category_outlined),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: selectedPageIndex.value == 1
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
