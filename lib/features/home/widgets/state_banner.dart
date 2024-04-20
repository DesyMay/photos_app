import 'package:flutter/material.dart';

class StateBanner extends StatelessWidget {
  final IconData icon;
  final String title;

  const StateBanner({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white,),
        Text(title, style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}