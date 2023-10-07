import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appTitle() {
    return const Text('GitHub Repo Star Counter');
  }

  _repoNameField() {}

  _numOfStar() {}
}
