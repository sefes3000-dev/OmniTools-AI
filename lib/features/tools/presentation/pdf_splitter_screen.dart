import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PdfSplitterScreen extends StatefulWidget {
  const PdfSplitterScreen({super.key});

  @override
  State<PdfSplitterScreen> createState() => _PdfSplitterScreenState();
}

class _PdfSplitterScreenState extends State<PdfSplitterScreen> {
  PlatformFile? _selectedFile;
  final _startPageController = TextEditingController(text: '1');
  final _endPageController = TextEditingController(text: '1');

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Splitter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _pickPdf,
              icon: const Icon(Icons.upload_file),
              label: const Text('Select PDF File'),
            ),
            const SizedBox(height: 20),
            if (_selectedFile != null) ...[
              Card(
                child: ListTile(
                  leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                  title: Text(_selectedFile!.name),
                  subtitle: Text('${(_selectedFile!.size / 1024).toStringAsFixed(1)} KB'),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _startPageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'From Page',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _endPageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'To Page',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing PDF pages extraction...')),
                  );
                },
                icon: const Icon(Icons.call_split),
                label: const Text('Extract Pages'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
