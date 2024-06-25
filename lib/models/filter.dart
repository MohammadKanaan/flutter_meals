class Filter {
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;
  final bool isVegan;

  const Filter({
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.isVegan,
  });

  Filter copyWith({
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegetarian,
    bool? isVegan,
  }) {
    return Filter(
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isVegetarian: isVegetarian ?? this.isVegetarian,
      isVegan: isVegan ?? this.isVegan,
    );
  }
}
