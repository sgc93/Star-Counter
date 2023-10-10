import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String data;
  const InfoCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(data),
    );
  }
}
