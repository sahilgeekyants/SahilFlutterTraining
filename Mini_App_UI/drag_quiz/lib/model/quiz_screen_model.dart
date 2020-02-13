import 'package:flutter/material.dart';

class Data {
  List<String> get imageData {
    return [
      'assets/apple.png',
      'assets/black_grapes.png',
      'assets/dates.png',
      'assets/grape.png',
      'assets/green_lemon.png',
      'assets/mango.png',
      'assets/orange.png'
    ];
  }

  List<String> get rightWrongImageData {
    return ['assets/right_tick.png', 'assets/wrong_tick.png'];
  }

  List<int> get answersequence {
    return [3, 5, 6, 4, 0, 1, 2];
  }

  List<Color> get colorData {
    return [
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.pink[900],
      Colors.black54,
      Colors.brown[900],
    ];
  }
}
