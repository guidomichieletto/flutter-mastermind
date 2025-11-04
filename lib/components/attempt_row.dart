import 'package:flutter/material.dart';
import 'package:mastermind/components/color_circle.dart';

class AttemptRow extends StatelessWidget {
  const AttemptRow({super.key, required this.colors, required this.feedback});

  final List<Color> colors;
  final List<int> feedback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var color in colors) ColorCircle(color: color),
        const SizedBox(width: 20),
        Column(
          children: [
            Text('Correct Position: ${feedback[0]}'),
            Text('Correct Color: ${feedback[1]}'),
          ],
        ),
      ],
    );
  }
}