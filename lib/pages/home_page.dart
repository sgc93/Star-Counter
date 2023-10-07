import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _repoName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _appTitle(),
                _repoNameField(),
                _numOfStar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appTitle() {
    return const Text('GitHub Repo Star Counter');
  }

  Widget _repoNameField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Enter a GitHub Repository',
        hintText: 'flutter/flutter',
      ),
      onSubmitted: (value) {
        setState(() {
          onRepoNameSubmitted(value);
        });
      },
    );
  }

  void onRepoNameSubmitted(String repoName) {
    _repoName = repoName;
  }

  Widget _numOfStar() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(_repoName),
    );
  }
}
