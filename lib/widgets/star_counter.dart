import 'package:flutter/material.dart';
import 'package:github/github.dart';

class StarCounter extends StatefulWidget {
  // full repository name : pp_name/repo_name
  final String repoName;

  // get repo name from HomePage Widget
  const StarCounter({
    super.key,
    required this.repoName,
  });

  @override
  State<StarCounter> createState() => _StarCounterState();
}

class _StarCounterState extends State<StarCounter> {
  // instance of GitHub API client
  late GitHub gitHub;

  // instance of Repository information
  Repository? repository;

  // error message : repo not found!
  String? errorMessage;

  // initialize GitHub API client
  @override
  void initState() {
    super.initState();
    gitHub = GitHub();
    _fetchRepository();
  }

  @override
  void didUpdateWidget(StarCounter oldWidget) {
    super.didUpdateWidget(oldWidget);

    // When this widget's [repoName] changes,
    // load the Repository information.
    if (widget.repoName == oldWidget.repoName) {
      return;
    }

    _fetchRepository();
  }

  Future<void> _fetchRepository() async {
    setState(() {
      repository = null;
      errorMessage = null;
    });

    if (widget.repoName.isNotEmpty) {
      var repo = await gitHub.repositories
          .getRepository(RepositorySlug.full(widget.repoName));
      setState(() {
        repository = repo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      // If there is an error
      return Text(errorMessage!);
    } else if (widget.repoName.isNotEmpty && repository == null) {
      // if no reason but internet
      return const Text('loading ...');
    } else if (repository == null) {
      // if no repo name is entered
      return const SizedBox();
    } else {
      return Text(repository!.stargazersCount.toString());
    }
  }
}
