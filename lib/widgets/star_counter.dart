import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:intl/intl.dart' as intl;
import 'package:repo_star_counter/widgets/card.dart';

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

    try {
      if (widget.repoName.isNotEmpty) {
        var repo = await gitHub.repositories
            .getRepository(RepositorySlug.full(widget.repoName));
        setState(() {
          repository = repo;
        });
      }
    } on RepositoryNotFound {
      setState(() {
        repository = null;
        errorMessage = '${widget.repoName} not found.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final errorStyle = textTheme.bodySmall!.apply(
      color: const Color.fromARGB(255, 112, 0, 0),
      fontSizeDelta: 8,
    );
    final numberFormater = intl.NumberFormat.decimalPattern();

    if (errorMessage != null) {
      // If there is an error
      return Text(
        errorMessage!,
        style: errorStyle,
      );
    } else if (widget.repoName.isNotEmpty && repository == null) {
      // if no reason but internet
      return const Text('loading ...');
    } else if (repository == null) {
      // if no repo name is entered
      return const SizedBox();
    } else {
      return Column(
        children: [
          InfoCard(
            type: 'Description: ',
            data: repository!.description,
          ),
          InfoCard(
            type: 'Visibility: ',
            data: repository!.visibility!,
          ),
          InfoCard(
            type: 'Language: ',
            data: repository!.language,
          ),
          InfoCard(
            type: 'Stars',
            data: numberFormater.format(repository!.stargazersCount),
          ),
          InfoCard(
            type: 'Forks',
            data: numberFormater.format(repository!.forksCount),
          ),
          InfoCard(
            type: 'Subscribers',
            data: numberFormater.format(repository!.subscribersCount),
          ),
          InfoCard(
            type: 'Watchers',
            data: numberFormater.format(repository!.watchersCount),
          ),
        ],
      );
    }
  }
}
