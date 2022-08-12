import 'package:flutter/material.dart';

class IndexChanger with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex(index) {
    _index = index;
    notifyListeners();
  }
}
