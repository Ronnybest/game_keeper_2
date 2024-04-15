import 'package:flutter/material.dart';

class GameInfoCard extends StatelessWidget {
  const GameInfoCard({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
    required this.constraints,
  });

  final String value;
  final String title;
  final IconData icon;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    double width =
        constraints.maxWidth / 4 < 92 ? constraints.maxWidth / 4 : 92;
    return SizedBox(
      width: width,
      height: width,
      child: Card(
        shadowColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 15,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
