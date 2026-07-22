import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImageResizerScreen extends StatefulWidget {
  const ImageResizerScreen({super.key});

  @override
  State<ImageResizerScreen> createState() => _ImageResizerScreenState();
}

class _ImageResizerScreenState extends State<ImageResizerScreen> {
  File? _selectedImage;
  File? _resizedImage;
  final _widthController = TextEditingController(text: '500');
  final _heightController = TextEditingController(text: '500');
  bool _isResizing = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _resizedImage = null;
      });
    }
  }

  Future<void> _resizeImage() async {
    if (_selectedImage == null) return;

    final targetWidth = int.tryParse(_widthController.text) ?? 500;
    final targetHeight = int.tryParse(_heightController.text) ?? 500;

    setState(() => _isResizing = true);

    final bytes = await _selectedImage!.readAsBytes();
    final decodedImage = img.decodeImage(bytes);

    if (decodedImage != null) {
      final resized = img.copyResize(decodedImage, width: targetWidth, height: targetHeight);
      final tempDir = await getTemporaryDirectory();
      final resizedFile = File('${tempDir.path}/resized_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await resizedFile.writeAsBytes(img.encodeJpg(resized));

      setState(() {
        _resizedImage = resizedFile;
      });
    }

    setState(() => _isResizing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Resizer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            if (_selectedImage != null) ...[
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _widthController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Width (px)', border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Height (px)', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _resizeImage,
                child: const Text('Resize Image'),
              ),
              const SizedBox(height: 16),
              if (_isResizing) const CircularProgressIndicator(),
              if (_resizedImage != null && !_isResizing) Expanded(child: Image.file(_resizedImage!)),
            ],
          ],
        ),
      ),
    );
  }
}
