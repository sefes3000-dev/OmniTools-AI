import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../tools/data/tool_registry.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OmniTools AI')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: ToolRegistry.allTools.length,
        itemBuilder: (context, index) {
          final tool = ToolRegistry.allTools[index];
          return Card(
            child: InkWell(
              onTap: () => context.push(tool.routePath),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(tool.icon, size: 40, color: Theme.of(context).primaryColor),
                    const SizedBox(height: 8),
                    Text(tool.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
