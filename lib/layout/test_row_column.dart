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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello world"),
              Text("I am Flutter"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("hello world"),
              Text("I'm flutter"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              Text("hello world"),
              Text("I'm flutter"),
            ],
          ),
          Row(
            verticalDirection: VerticalDirection.up,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("hello world", style: TextStyle(fontSize: 30.0),),
              Text("I'm flutter"),
            ],
          ),
        ],
      ),
    );
  }
}
