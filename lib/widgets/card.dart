import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String type;
  final String data;
  const InfoCard({
    super.key,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textStyle = textTheme.bodyLarge!.apply(
      color: const Color.fromRGBO(19, 80, 25, 1),
      fontWeightDelta: 800,
    );
    return Container(
      width: 450,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Text(
        '> $type: $data',
        style: textStyle,
      ),
    );
  }
}
