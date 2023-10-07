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
  }

  Future<void> _fetchRepository() async {
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
    return const Placeholder();
  }
}
