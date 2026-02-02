// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/home_hero.dart';
import 'widgets/transactions_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: const [
              HomeHero(),
              SizedBox(height: 5),
              TransactionsSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
