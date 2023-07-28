import 'package:flutter/material.dart';

class PillingInfoRow extends StatelessWidget {
  const PillingInfoRow({
    super.key,
    required this.title,
    required this.cost,
  });

  final String title;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        Text(
          cost,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ],
    );
  }
}
