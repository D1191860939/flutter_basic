import 'package:flutter/material.dart';

class TabBarViewTestPage extends StatefulWidget {
  const TabBarViewTestPage({super.key});

  @override
  State createState() {
    return _TabBarViewTestPageState();
  }
}

class _TabBarViewTestPageState extends State<TabBarViewTestPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = ["新闻", "历史", "图片"];
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TabBarView"),
          bottom: TabBar(
            tabs: _tabs.map((e) => Tab(text: e)).toList(),
            controller: _controller,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: _tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(e),
            );
          }).toList(),
        ));
  }

}
