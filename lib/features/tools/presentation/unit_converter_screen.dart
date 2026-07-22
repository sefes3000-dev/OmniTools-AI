import 'package:flutter/material.dart';

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double _meters = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unit Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Meters'),
              onChanged: (v) => setState(() => _meters = double.tryParse(v) ?? 0),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Kilometers'),
              trailing: Text('${_meters / 1000} km'),
            ),
            ListTile(
              title: const Text('Feet'),
              trailing: Text('${(_meters * 3.28084).toStringAsFixed(2)} ft'),
            ),
          ],
        ),
      ),
    );
  }
}
