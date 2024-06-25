import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: const Center(
        child: Text('Meals'),
      ),
    );
  }
}
