import 'package:calculator/views/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_viewmodel.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                viewModel.display,
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                _buildRow(context, ['7', '8', '9', '/']),
                _buildRow(context, ['4', '5', '6', '*']),
                _buildRow(context, ['1', '2', '3', '-']),
                _buildRow(context, ['C', '0', '=', '+']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, List<String> values) {
    final viewModel = context.read<CalculatorViewModel>();
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((value) {
          return CalculatorButton(
            value: value,
            onPressed: (value) {
              if (value == 'C') {
                viewModel.clear();
              } else {
                viewModel.onButtonPressed(value);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
