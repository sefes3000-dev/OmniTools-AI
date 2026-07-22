import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  State<PasswordGeneratorScreen> createState() => _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  double _length = 12;
  bool _includeUpper = true;
  bool _includeNumbers = true;
  bool _includeSpecial = true;
  String _generatedPassword = '';

  void _generate() {
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const special = '!@#\$%^&*()_+-=';

    String allowed = lower;
    if (_includeUpper) allowed += upper;
    if (_includeNumbers) allowed += numbers;
    if (_includeSpecial) allowed += special;

    final rand = Random();
    setState(() {
      _generatedPassword = List.generate(
        _length.toInt(),
        (_) => allowed[rand.nextInt(allowed.length)],
      ).join();
    });
  }

  @override
  void initState() {
    super.initState();
    _generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: SelectableText(
                  _generatedPassword,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _generatedPassword));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Copied to clipboard')),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Length: ${_length.toInt()}'),
            Slider(
              value: _length,
              min: 6,
              max: 32,
              onChanged: (v) {
                setState(() => _length = v);
                _generate();
              },
            ),
            SwitchListTile(
              title: const Text('Include Uppercase'),
              value: _includeUpper,
              onChanged: (v) {
                setState(() => _includeUpper = v);
                _generate();
              },
            ),
            SwitchListTile(
              title: const Text('Include Numbers'),
              value: _includeNumbers,
              onChanged: (v) {
                setState(() => _includeNumbers = v);
                _generate();
              },
            ),
            SwitchListTile(
              title: const Text('Include Special Characters'),
              value: _includeSpecial,
              onChanged: (v) {
                setState(() => _includeSpecial = v);
                _generate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
