import 'package:flutter/material.dart';
import '../models/calculator_logic.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorLogic _calculatorLogic = CalculatorLogic();

  String _display = '0';
  String get display => _display;

  void onButtonPressed(String value) {
    _display = _calculatorLogic.processInput(value);
    notifyListeners(); // Notify the view to rebuild when state changes.
  }

  void clear() {
    _calculatorLogic.processInput('C');
    _display = '0';
    notifyListeners();
  }
}
