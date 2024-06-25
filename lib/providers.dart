import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/models/category.dart';

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
