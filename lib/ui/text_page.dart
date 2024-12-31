import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文本及样式"),
      ),
      body: Column(
        children: [
          Text(
            "Hello World" * 6,
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world! I'm Jack. " * 8,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text("Hello World",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen,
                  fontSize: 16)),
          Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: "Home:"),
                    TextSpan(text: "https://flutterchina.club", style: TextStyle(color: Colors.blue), recognizer: _tapGestureRecognizer)
                  ]
              )
          )
        ],
      ),
    );
  }
}
