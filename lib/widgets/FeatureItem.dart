
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.check_circle_outline_outlined, color: Colors.green),
        ],
      ),
    );
  }
}
