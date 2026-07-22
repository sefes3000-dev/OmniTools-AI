import 'package:flutter/material.dart';
import '../domain/models/tool_model.dart';

class ToolRegistry {
  static final List<ToolModel> allTools = [
    const ToolModel(
      id: 'password_generator',
      title: 'Password Generator',
      description: 'Create secure passwords easily',
      icon: Icons.lock_outline,
      category: ToolCategory.securityTools,
      routePath: '/password-generator',
    ),
    const ToolModel(
      id: 'hash_generator',
      title: 'Hash Generator',
      description: 'Generate MD5, SHA-1, SHA-256 hashes',
      icon: Icons.security,
      category: ToolCategory.securityTools,
      routePath: '/hash-generator',
    ),
    const ToolModel(
      id: 'qr_generator',
      title: 'QR Generator',
      description: 'Generate custom QR codes',
      icon: Icons.qr_code,
      category: ToolCategory.developerTools,
      routePath: '/qr-generator',
    ),
    const ToolModel(
      id: 'base64',
      title: 'Base64 Encoder/Decoder',
      description: 'Encode or decode text string to Base64',
      icon: Icons.code,
      category: ToolCategory.developerTools,
      routePath: '/base64',
    ),
    const ToolModel(
      id: 'bmi_calculator',
      title: 'BMI Calculator',
      description: 'Calculate Body Mass Index',
      icon: Icons.monitor_weight_outlined,
      category: ToolCategory.calculators,
      routePath: '/bmi-calculator',
    ),
    const ToolModel(
      id: 'unit_converter',
      title: 'Unit Converter',
      description: 'Convert length, weight, and temperature',
      icon: Icons.sync_alt,
      category: ToolCategory.calculators,
      routePath: '/unit-converter',
    ),
  ];
}
