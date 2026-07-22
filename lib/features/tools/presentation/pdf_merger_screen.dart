import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfMergerScreen extends StatefulWidget {
  const PdfMergerScreen({super.key});

  @override
  State<PdfMergerScreen> createState() => _PdfMergerScreenState();
}

class _PdfMergerScreenState extends State<PdfMergerScreen> {
  List<PlatformFile> _selectedFiles = [];
  bool _isProcessing = false;

  Future<void> _pickPdfFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
    }
  }

  Future<void> _mergeAndSharePdfs() async {
    if (_selectedFiles.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least 2 PDF files to merge')),
      );
      return;
    }

    setState(() => _isProcessing = true);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Merging ${_selectedFiles.length} files...')),
    );

    setState(() => _isProcessing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Merger')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _pickPdfFiles,
              icon: const Icon(Icons.add_to_drive),
              label: const Text('Select PDF Files'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _selectedFiles.isEmpty
                  ? const Center(child: Text('No PDF files selected.'))
                  : ListView.builder(
                      itemCount: _selectedFiles.length,
                      itemBuilder: (context, index) {
                        final file = _selectedFiles[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                            title: Text(file.name),
                            subtitle: Text('${(file.size / 1024).toStringAsFixed(1)} KB'),
                            trailing: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _selectedFiles.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
            if (_selectedFiles.length >= 2)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _isProcessing ? null : _mergeAndSharePdfs,
                  icon: const Icon(Icons.merge_type),
                  label: const Text('Merge PDFs'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
