import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class HashGeneratorScreen extends StatefulWidget {
  const HashGeneratorScreen({super.key});

  @override
  State<HashGeneratorScreen> createState() => _HashGeneratorScreenState();
}

class _HashGeneratorScreenState extends State<HashGeneratorScreen> {
  final _controller = TextEditingController();
  String _md5 = '';
  String _sha256 = '';

  void _hash() {
    final bytes = utf8.encode(_controller.text);
    setState(() {
      _md5 = md5.convert(bytes).toString();
      _sha256 = sha256.convert(bytes).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hash Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter Text'),
              onChanged: (_) => _hash(),
            ),
            const SizedBox(height: 20),
            ListTile(title: const Text('MD5'), subtitle: SelectableText(_md5)),
            ListTile(title: const Text('SHA-256'), subtitle: SelectableText(_sha256)),
          ],
        ),
      ),
    );
  }
}
