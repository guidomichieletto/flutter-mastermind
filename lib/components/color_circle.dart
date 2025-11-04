import 'package:flutter/material.dart';

class ColorCircle extends StatefulWidget {
  const ColorCircle({super.key, required this.color});

  final Color color;

  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  Color get color => widget.color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}