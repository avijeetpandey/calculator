import 'package:calculator/viewmodels/calculator_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorViewModel', () {
    test('Should display "8" after performing addition', () {
      final viewModel = CalculatorViewModel();

      viewModel.onButtonPressed('5');
      viewModel.onButtonPressed('+');
      viewModel.onButtonPressed('3');
      viewModel.onButtonPressed('=');

      expect(viewModel.display, '8.0');
    });

    test('Should display "Error" for division by zero', () {
      final viewModel = CalculatorViewModel();

      viewModel.onButtonPressed('5');
      viewModel.onButtonPressed('/');
      viewModel.onButtonPressed('0');
      viewModel.onButtonPressed('=');

      expect(viewModel.display, 'Error');
    });

    test('Should reset to "0" when "C" is pressed', () {
      final viewModel = CalculatorViewModel();

      viewModel.onButtonPressed('5');
      viewModel.clear();

      expect(viewModel.display, '0');
    });
  });
}
