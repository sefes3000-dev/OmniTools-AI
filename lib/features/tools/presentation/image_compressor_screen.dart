import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImageCompressorScreen extends StatefulWidget {
  const ImageCompressorScreen({super.key});

  @override
  State<ImageCompressorScreen> createState() => _ImageCompressorScreenState();
}

class _ImageCompressorScreenState extends State<ImageCompressorScreen> {
  File? _originalImage;
  File? _compressedImage;
  int _quality = 70;
  bool _isCompressing = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _originalImage = File(pickedFile.path);
        _compressedImage = null;
      });
      _compressImage();
    }
  }

  Future<void> _compressImage() async {
    if (_originalImage == null) return;

    setState(() => _isCompressing = true);

    final bytes = await _originalImage!.readAsBytes();
    final decodedImage = img.decodeImage(bytes);

    if (decodedImage == null) {
      setState(() => _isCompressing = false);
      return;
    }

    final compressedBytes = img.encodeJpg(decodedImage, quality: _quality);
    final tempDir = await getTemporaryDirectory();
    final compressedFile = File('${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg');
    await compressedFile.writeAsBytes(compressedBytes);

    setState(() {
      _compressedImage = compressedFile;
      _isCompressing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Compressor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            if (_originalImage != null) ...[
              Text('Quality: $_quality%'),
              Slider(
                value: _quality.toDouble(),
                min: 10,
                max: 100,
                divisions: 9,
                onChanged: (v) {
                  setState(() => _quality = v.toInt());
                  _compressImage();
                },
              ),
              const SizedBox(height: 10),
              if (_isCompressing) const CircularProgressIndicator(),
              if (_compressedImage != null && !_isCompressing) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Original: ${(_originalImage!.lengthSync() / 1024).toStringAsFixed(1)} KB'),
                    Text('Compressed: ${(_compressedImage!.lengthSync() / 1024).toStringAsFixed(1)} KB'),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(child: Image.file(_compressedImage!)),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
