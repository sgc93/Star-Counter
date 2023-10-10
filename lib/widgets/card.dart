import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String data;
  const InfoCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textStyle = textTheme.bodyLarge!.apply(
      color: const Color.fromRGBO(19, 80, 25, 1),
      fontWeightDelta: 800,
      fontSizeDelta: 20,
    );
    return Card(
      child: Text(
        data,
        style: textStyle,
      ),
    );
  }
}
