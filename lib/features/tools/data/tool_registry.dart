import 'package:flutter/material.dart';

enum ToolCategory {
  utilities,
  developerTools,
  phoneTools,
  imageTools,
  pdfTools,
}

class ToolModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final ToolCategory category;
  final String routePath;

  const ToolModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    required this.routePath,
  });
}

class ToolRegistry {
  static const List<ToolModel> allTools = [
    // Developer & Utility Tools
    ToolModel(
      id: 'password_generator',
      title: 'Password Generator',
      description: 'Generate secure passwords',
      icon: Icons.lock,
      category: ToolCategory.developerTools,
      routePath: '/password-generator',
    ),
    ToolModel(
      id: 'hash_generator',
      title: 'Hash Generator',
      description: 'MD5, SHA1, SHA256 hashes',
      icon: Icons.security,
      category: ToolCategory.developerTools,
      routePath: '/hash-generator',
    ),
    ToolModel(
      id: 'qr_generator',
      title: 'QR Code Generator',
      description: 'Generate custom QR codes',
      icon: Icons.qr_code,
      category: ToolCategory.utilities,
      routePath: '/qr-generator',
    ),
    ToolModel(
      id: 'base64',
      title: 'Base64 Encoder',
      description: 'Encode and decode Base64 text',
      icon: Icons.code,
      category: ToolCategory.developerTools,
      routePath: '/base64',
    ),
    ToolModel(
      id: 'bmi_calculator',
      title: 'BMI Calculator',
      description: 'Calculate body mass index',
      icon: Icons.fitness_center,
      category: ToolCategory.utilities,
      routePath: '/bmi-calculator',
    ),
    ToolModel(
      id: 'unit_converter',
      title: 'Unit Converter',
      description: 'Convert common measurement units',
      icon: Icons.square_foot,
      category: ToolCategory.utilities,
      routePath: '/unit-converter',
    ),
    ToolModel(
      id: 'text_counter',
      title: 'Text Counter',
      description: 'Count words, characters, and lines',
      icon: Icons.numbers,
      category: ToolCategory.utilities,
      routePath: '/text-counter',
    ),
    ToolModel(
      id: 'case_converter',
      title: 'Case Converter',
      description: 'Convert upper, lower, capital cases',
      icon: Icons.text_fields,
      category: ToolCategory.utilities,
      routePath: '/case-converter',
    ),
    ToolModel(
      id: 'json_formatter',
      title: 'JSON Formatter',
      description: 'Format and beautify JSON strings',
      icon: Icons.data_object,
      category: ToolCategory.developerTools,
      routePath: '/json-formatter',
    ),
    ToolModel(
      id: 'uuid_generator',
      title: 'UUID Generator',
      description: 'Generate v4 UUID strings',
      icon: Icons.fingerprint,
      category: ToolCategory.developerTools,
      routePath: '/uuid-generator',
    ),

    // Phone Tools
    ToolModel(
      id: 'device_info',
      title: 'Device Info',
      description: 'View device hardware specs',
      icon: Icons.phone_android,
      category: ToolCategory.phoneTools,
      routePath: '/device-info',
    ),
    ToolModel(
      id: 'battery_info',
      title: 'Battery Info',
      description: 'Check battery status and level',
      icon: Icons.battery_charging_full,
      category: ToolCategory.phoneTools,
      routePath: '/battery-info',
    ),
    ToolModel(
      id: 'flashlight',
      title: 'Flashlight',
      description: 'Toggle device flashlight',
      icon: Icons.flash_on,
      category: ToolCategory.utilities,
      routePath: '/flashlight',
    ),
    ToolModel(
      id: 'compass',
      title: 'Compass',
      description: 'Direction compass sensor',
      icon: Icons.explore,
      category: ToolCategory.utilities,
      routePath: '/compass',
    ),

    // Image Tools
    ToolModel(
      id: 'ocr',
      title: 'OCR Text Scanner',
      description: 'Extract text from images',
      icon: Icons.document_scanner,
      category: ToolCategory.imageTools,
      routePath: '/ocr',
    ),
    ToolModel(
      id: 'image_compressor',
      title: 'Image Compressor',
      description: 'Reduce image file size',
      icon: Icons.compress,
      category: ToolCategory.imageTools,
      routePath: '/image-compressor',
    ),
    ToolModel(
      id: 'image_resizer',
      title: 'Image Resizer',
      description: 'Change image dimensions',
      icon: Icons.aspect_ratio,
      category: ToolCategory.imageTools,
      routePath: '/image-resizer',
    ),

    // PDF Tools
    ToolModel(
      id: 'pdf_creator',
      title: 'PDF Creator',
      description: 'Create PDF files from custom text',
      icon: Icons.picture_as_pdf,
      category: ToolCategory.pdfTools,
      routePath: '/pdf-creator',
    ),
    ToolModel(
      id: 'pdf_merger',
      title: 'PDF Merger',
      description: 'Combine multiple PDF files',
      icon: Icons.merge_type,
      category: ToolCategory.pdfTools,
      routePath: '/pdf-merger',
    ),
    ToolModel(
      id: 'pdf_splitter',
      title: 'PDF Splitter',
      description: 'Extract pages from PDF file',
      icon: Icons.call_split,
      category: ToolCategory.pdfTools,
      routePath: '/pdf-splitter',
    ),
  ];
}
