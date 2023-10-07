import 'package:flutter/material.dart';
import 'package:repo_star_counter/pages/home_page.dart';

void main() {
  runApp(const StarCounterApp());
}

class StarCounterApp extends StatelessWidget {
  const StarCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repo Star counter WebApp',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      routes: {
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
