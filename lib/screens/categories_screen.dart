import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: const Categories(),
    );
  }
}

class Categories extends HookWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    var animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            ...availableCategories.map(
              (category) {
                return CategoryGridItem(category: category);
              },
            ),
          ],
        ),
      ),
      builder: (context, child) => SlideTransition(
        position: animationController.drive(Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).chain(CurveTween(curve: Curves.easeInOut))),
        child: child,
      ),
    );
  }
}
