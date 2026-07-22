import 'package:flutter/material.dart';

class TextCounterScreen extends StatefulWidget {
  const TextCounterScreen({super.key});

  @override
  State<TextCounterScreen> createState() => _TextCounterScreenState();
}

class _TextCounterScreenState extends State<TextCounterScreen> {
  final _controller = TextEditingController();

  int get _charCount => _controller.text.length;
  int get _wordCount {
    final text = _controller.text.trim();
    if (text.isEmpty) return 0;
    return text.split(RegExp(r'\s+')).length;
  }
  int get _lineCount {
    if (_controller.text.isEmpty) return 0;
    return _controller.text.split('\n').length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Counter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Enter or paste your text here',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildStatCard('Characters', '$_charCount'),
                _buildStatCard('Words', '$_wordCount'),
                _buildStatCard('Lines', '$_lineCount'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
