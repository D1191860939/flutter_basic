import 'package:flutter/material.dart';

class PageViewTestPage extends StatefulWidget {
  const PageViewTestPage({super.key});

  @override
  @override
  State<StatefulWidget> createState() {
    return _PageViewTestPageState();
  }
}

class _PageViewTestPageState extends State<PageViewTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageViewTestPage')),
      body: PageView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Center(
                child: Text("$index", textScaler: const TextScaler.linear(5),
            ));
          }),
    );
  }
}
