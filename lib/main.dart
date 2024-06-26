import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/screens/tabs.dart';

final kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    bodyMedium: TextStyle(
      color: kColorScheme.onSurface,
    ),
  ),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Tabs(),
    );
  }
}
