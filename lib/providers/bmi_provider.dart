import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  int _weight = 40;
  int _age = 20;
  double _height = 80.0;
  bool _isMale = true;

  int get age {
    return _age;
  }

  int get weight {
    return _weight;
  }

  double get height {
    return _height;
  }

  void set height(value) {
    _height = value;
    notifyListeners();
  }

  bool get isMale {
    return _isMale;
  }

  void set isMale(value) {
    _isMale = value;
    notifyListeners();
  }

  void incrementAge() {
    _age++;
    notifyListeners();
  }

  void decrementAge() {
    if (_age != 0) _age--;
    notifyListeners();
  }

  void incrementWeight() {
    _weight++;
    notifyListeners();
  }

  void decrementWeight() {
    if (_weight != 0) _weight--;
    notifyListeners();
  }
}
