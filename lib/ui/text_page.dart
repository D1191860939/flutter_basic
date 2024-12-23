import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文本及样式"),
      ),
      body: Column(
        children: [
          Text(
            "Hello World",
            textAlign: TextAlign.left,
          ),
          Text(
            "Hello world! I'm Jack. " * 4,
            overflow: TextOverflow.ellipsis,
          ),
          Text("Hello World", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
