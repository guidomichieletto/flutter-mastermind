import 'package:flutter/material.dart';
import 'package:mastermind/components/color_circle.dart';
import 'package:mastermind/game.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key, required this.game});

  final Game game;

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final List<int> _selectedColors = [0, 0, 0, 0];

  void _swapColor(int index) {
    setState(() {
      _selectedColors[index] = (_selectedColors[index] + 1) % Game.availableColors.length;
    });
  }

  void _submitGuess() {
    List<Color> attempt = _selectedColors
        .map((index) => Game.availableColors[index])
        .toList();

    widget.game.addAttempt(attempt);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          children: [
            for (int i = 0; i < Game.codeLength; i++)
              GestureDetector(
                onTap: () => _swapColor(i),
                child: ColorCircle(color: Game.availableColors[_selectedColors[i]]),
              ),
          ]
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _submitGuess,
          child: const Text('Submit Guess'),
        ),
      ],
    );
  }
}