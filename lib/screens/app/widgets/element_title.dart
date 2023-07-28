import 'package:flutter/material.dart';

class ElementTitle extends StatelessWidget {
  const ElementTitle({
    super.key,
    required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}