import 'package:flutter/material.dart';

class Game extends ChangeNotifier {
  List<Color> secret = [];
  List<List<Color>> attempts = [];

  static final int maxAttempts = 8;
  static final int codeLength = 4;

  static final List<Color> availableColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];

  Game() {
    _generateSecret();
    attempts = [];
  }

  void _generateSecret() {
    List<Color> copy = List.from(availableColors);
    copy.shuffle();
    secret = copy.take(codeLength).toList();
  }

  void addAttempt(List<Color> attempt) {
    if (attempt.length == codeLength && attempts.length < maxAttempts) {
      attempts.add(attempt);
      notifyListeners();
    }
  }

  List<int> getFeedback(int index) {
    if(index < 0 || index >= attempts.length) {
      return [0, 0];
    }

    List<bool> ignore = List.filled(codeLength, false);

    // Checks for both correct color and position
    int correctPosColors = 0;
    for(int i = 0; i < codeLength; i++) {
      if(attempts[index][i] == secret[i]) {
        correctPosColors++;
        ignore[i] = true;
      }
    }

    // Checks for correct color but wrong position, ignoring already matched pegs
    int correctColors = 0;
    for(int i = 0; i < codeLength; i++) {
      if(ignore[i]) continue;
      for(int j = 0; j < codeLength; j++) {
        if(!ignore[j] && attempts[index][i] == secret[j]) {
          correctColors++;
          ignore[j] = true;
          break;
        }
      }
    }

    return [correctPosColors, correctColors];
  }

  // 0: ongoing, 1: won, 2: lost
  int gameStatus() {
    if(getFeedback(attempts.length - 1)[0] == codeLength) {
      return 1; // won
    } else if(attempts.length >= maxAttempts) {
      return 2; // lost
    }

    return 0; // ongoing
  }
}