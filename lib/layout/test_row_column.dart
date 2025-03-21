import 'package:flutter/material.dart';

class TestRowColumnPage extends StatelessWidget {
  const TestRowColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试Row和Column"),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("hello world"),
              Text("I am Flutter"),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: [
              Text("hello world"),
              Text("I'm flutter"),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
          )
        ],
      ),
    );
  }
}
