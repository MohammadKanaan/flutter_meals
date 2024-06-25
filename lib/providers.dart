import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class SelectedCategoryNotifier extends StateNotifier<Category> {
  // We initialize the list of todos to an empty list
  SelectedCategoryNotifier()
      : super(const Category(id: '1', title: 'All', color: Colors.white));

  void setCategroy(Category category) {
    state = category;
  }
}

final selectedCategoryProvider =
    StateNotifierProvider<SelectedCategoryNotifier, Category>((ref) {
  return SelectedCategoryNotifier();
});

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // We initialize the list of todos to an empty list
  FavoriteMealsNotifier() : super([]);

  void addFavoriteMeal(Meal meal) {
    state = [...state, meal];
  }

  void removeFavoriteMeal(Meal meal) {
    state = state.where((element) => element.id != meal.id).toList();
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
