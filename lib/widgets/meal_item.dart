import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/detailed_meal_screen.dart';
import 'package:meals/utils/utils.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => DetailedMealScreen(meal: meal),
            ),
          );
        },
        child: MealItemContent(meal: meal),
      ),
    );
  }
}

class MealItemContent extends StatelessWidget {
  final Meal meal;
  const MealItemContent({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: meal.id,
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            color: Colors.black54.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              children: [
                Text(
                  meal.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 26, color: Colors.white),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MealItemTrait(
                      icon: Icons.schedule,
                      text: '${meal.duration} min',
                    ),
                    MealItemTrait(
                      icon: Icons.work,
                      text: uppercaseFirstLetter(meal.complexity.name),
                    ),
                    MealItemTrait(
                      icon: Icons.attach_money,
                      text: uppercaseFirstLetter(meal.affordability.name),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
