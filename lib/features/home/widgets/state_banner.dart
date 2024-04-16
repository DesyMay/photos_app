import 'package:flutter/material.dart';

class StatBanner extends StatelessWidget {
  final IconData icon;
  final String title;

  const StatBanner({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(title),
      ],
    );
  }
}