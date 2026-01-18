import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: SakuinApp()));
}

class SakuinApp extends StatelessWidget {
  const SakuinApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color scaffoldBackground = Color(0xFF0B0C10);
    const Color primaryColor = Color(0xFF66FCF1);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sakuin',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: scaffoldBackground,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          surface: scaffoldBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: scaffoldBackground,
          foregroundColor: primaryColor,
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
