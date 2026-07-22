import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  double _height = 170;
  double _weight = 70;

  double get _bmi => _weight / ((_height / 100) * (_height / 100));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Height: ${_height.toInt()} cm'),
            Slider(
              value: _height,
              min: 100,
              max: 220,
              onChanged: (v) => setState(() => _height = v),
            ),
            Text('Weight: ${_weight.toInt()} kg'),
            Slider(
              value: _weight,
              min: 30,
              max: 150,
              onChanged: (v) => setState(() => _weight = v),
            ),
            const SizedBox(height: 30),
            Text('Your BMI: ${_bmi.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
