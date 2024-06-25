import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class DetailedMealScreen extends StatelessWidget {
  const DetailedMealScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Center(
        child: Text('Meal Details'),
      ),
    );
  }
}
