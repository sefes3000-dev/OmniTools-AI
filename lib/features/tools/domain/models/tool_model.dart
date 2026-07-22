import 'package:flutter/material.dart';

enum ToolCategory {
  fileTools,
  imageTools,
  videoTools,
  pdfTools,
  textTools,
  aiTools,
  networkTools,
  phoneTools,
  securityTools,
  developerTools,
  calculators,
  utilities,
}

class ToolModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final ToolCategory category;
  final String routePath;
  final bool isPremium;
  final bool isNew;

  const ToolModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    required this.routePath,
    this.isPremium = false,
    this.isNew = false,
  });
}
