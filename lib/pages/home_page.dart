import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repo_star_counter/widgets/star_counter.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: const Color.fromRGBO(33, 43, 66, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appDescription(),
          Align(
            alignment: Alignment.center,
            child: Card(
              color: const Color.fromRGBO(92, 125, 165, 1),
              shadowColor: Colors.white54,
              child: Container(
                padding: const EdgeInsets.all(16.0),
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
          _githubRepoLink(),
        ],
      ),
    );
  }

  _githubRepoLink() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: 'check me on GitHub',
            style: const TextStyle(
              color: Color.fromRGBO(121, 165, 125, 1),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(
                  Uri(
                    path: 'https://github.com/sgc93/star_counter',
                  ),
                );
              },
          ),
        ),
      ),
    );
  }

  Widget _appDescription() {
    return Container(
      padding: const EdgeInsets.all(28.0),
      height: 150,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GitHub Repository Star Counter',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'A simplified flutter web app to count and display number of star of a given GitHub repositories.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'Inspired by flutter codelabs',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _appTitle() {
    return Text(
      'Count a Repo\'s Star',
      style: Theme.of(context).textTheme.headlineMedium!.apply(
          color: const Color.fromRGBO(33, 43, 66, 0.6), fontWeightDelta: 800),
    );
  }

  Widget _repoNameField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Enter a GitHub Repository Name',
        labelStyle: TextStyle(
          color: Color.fromRGBO(33, 43, 66, 0.6),
          fontWeight: FontWeight.bold,
        ),
        hintStyle: TextStyle(
          color: Color.fromRGBO(33, 43, 66, 1),
          fontWeight: FontWeight.w900,
        ),
        hintText: 'flutter/flutter',
      ),
      style: const TextStyle(
        color: Color.fromRGBO(33, 43, 66, 1),
        fontWeight: FontWeight.w900,
        fontSize: 17,
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
      child: StarCounter(repoName: _repoName),
    );
  }
}
