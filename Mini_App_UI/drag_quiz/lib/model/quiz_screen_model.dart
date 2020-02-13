import 'package:flutter/material.dart';

class Data {
  List<String> get rightWrongImageData {
    return ['assets/right_tick.png', 'assets/wrong_tick.png'];
  }

  List<Map<int, Color>> get colorData {
    return [
      {0: Colors.green},
      {1: Colors.yellow},
      {2: Colors.orange},
      {3: Colors.red},
      {4: Colors.pink[900]},
      {5: Colors.black87},
      {6: Colors.brown[900]},
    ];
  }

  List<Map<int, String>> get imageData {
    return [
      {3: 'assets/apple.png'},
      {5: 'assets/black_grapes.png'},
      {6: 'assets/dates.png'},
      {4: 'assets/grape.png'},
      {0: 'assets/green_lemon.png'},
      {1: 'assets/mango.png'},
      {2: 'assets/orange.png'}
    ];
  }
}
