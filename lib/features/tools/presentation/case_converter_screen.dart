import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaseConverterScreen extends StatefulWidget {
  const CaseConverterScreen({super.key});

  @override
  State<CaseConverterScreen> createState() => _CaseConverterScreenState();
}

class _CaseConverterScreenState extends State<CaseConverterScreen> {
  final _controller = TextEditingController();

  void _convert(String Function(String) conversion) {
    setState(() {
      _controller.text = conversion(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Case Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Input Text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _convert((s) => s.toUpperCase()),
                  child: const Text('UPPERCASE'),
                ),
                ElevatedButton(
                  onPressed: () => _convert((s) => s.toLowerCase()),
                  child: const Text('lowercase'),
                ),
                ElevatedButton(
                  onPressed: () => _convert((s) => s.split(' ').map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}' : '').join(' ')),
                  child: const Text('Capitalized Case'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _controller.text));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Text copied!')),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
