import 'dart:convert';
import 'package:flutter/material.dart';

class Base64Screen extends StatefulWidget {
  const Base64Screen({super.key});

  @override
  State<Base64Screen> createState() => _Base64ScreenState();
}

class _Base64ScreenState extends State<Base64Screen> {
  final _inputController = TextEditingController();
  String _output = '';

  void _encode() {
    setState(() {
      _output = base64.encode(utf8.encode(_inputController.text));
    });
  }

  void _decode() {
    try {
      setState(() {
        _output = utf8.decode(base64.decode(_inputController.text));
      });
    } catch (_) {
      setState(() => _output = 'Invalid Base64 string');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Base64 Encoder / Decoder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(labelText: 'Input Text'),
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _encode, child: const Text('Encode')),
                ElevatedButton(onPressed: _decode, child: const Text('Decode')),
              ],
            ),
            const SizedBox(height: 20),
            SelectableText(_output, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
