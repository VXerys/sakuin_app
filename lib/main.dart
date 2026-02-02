import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: SakuinApp()));
}

class SakuinApp extends StatelessWidget {
  const SakuinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sakuin',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
