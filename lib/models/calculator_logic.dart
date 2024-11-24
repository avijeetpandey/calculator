class CalculatorLogic {
  String _input = '';
  String _result = '0';
  String _operator = '';
  double? _firstOperand;

  String processInput(String input) {
    if (input == 'C') {
      _clear();
    } else if (input == '=') {
      _calculate();
    } else if (_isOperator(input)) {
      _operator = input;
      _firstOperand = double.tryParse(_input);
      _input = '';
    } else {
      _input += input;
      _result = _input;
    }
    return _result;
  }

  void _clear() {
    _input = '';
    _result = '0';
    _operator = '';
    _firstOperand = null;
  }

  void _calculate() {
    double? secondOperand = double.tryParse(_input);
    if (_firstOperand != null && secondOperand != null) {
      switch (_operator) {
        case '+':
          _result = (_firstOperand! + secondOperand).toString();
          break;
        case '-':
          _result = (_firstOperand! - secondOperand).toString();
          break;
        case '*':
          _result = (_firstOperand! * secondOperand).toString();
          break;
        case '/':
          _result = secondOperand != 0
              ? (_firstOperand! / secondOperand).toString()
              : 'Error';
          break;
      }
      _input = '';
      _operator = '';
      _firstOperand = null;
    }
  }

  bool _isOperator(String value) {
    return ['+', '-', '*', '/'].contains(value);
  }
}
