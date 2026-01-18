import 'package:flutter/material.dart';

void main() {
  runApp(const SakuinApp());
}

class SakuinApp extends StatelessWidget {
  const SakuinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakuin App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: Center(child: Text('Welcome to Sakuin App!'))),
    );
  }
}
