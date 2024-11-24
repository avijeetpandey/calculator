import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final Function(String) onPressed;

  const CalculatorButton({
    Key? key,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(value),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 70),
        shape: const CircleBorder(),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
