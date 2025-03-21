import 'package:flutter/material.dart';

class TestLayoutPage extends StatelessWidget {
  const TestLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局测试"),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: 50, minWidth: double.infinity),
            child: Container(
              height: 80,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
            width: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 90, minHeight: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 60, minHeight: 60),
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
