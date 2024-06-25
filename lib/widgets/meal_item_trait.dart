import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String text;
  const MealItemTrait({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
