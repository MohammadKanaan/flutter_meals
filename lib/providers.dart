import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/filter.dart';
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

class ActiveScreenNotifier extends StateNotifier<int> {
  // We initialize the list of todos to an empty list
  ActiveScreenNotifier() : super(0);

  void setActiveScreen(int index) {
    state = index;
  }
}

final activeScreenProvider =
    StateNotifierProvider<ActiveScreenNotifier, int>((ref) {
  return ActiveScreenNotifier();
});

class FiltersNotifier extends StateNotifier<Filter> {
  // We initialize the list of todos to an empty list
  FiltersNotifier()
      : super(const Filter(
          isGlutenFree: false,
          isLactoseFree: false,
          isVegetarian: false,
          isVegan: false,
        ));

  void setIsGlutenFree(bool value) {
    state = state.copyWith(isGlutenFree: value);
  }

  void setIsLactoseFree(bool value) {
    state = state.copyWith(isLactoseFree: value);
  }

  void setIsVegetarian(bool value) {
    state = state.copyWith(isVegetarian: value);
  }

  void setIsVegan(bool value) {
    state = state.copyWith(isVegan: value);
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Filter>((ref) {
  return FiltersNotifier();
});
