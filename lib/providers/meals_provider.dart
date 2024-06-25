import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
