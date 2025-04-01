import 'package:flutter/material.dart';

class ScrollControllerTestPage extends StatefulWidget {
  const ScrollControllerTestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerTestPageState();
  }
}

class _ScrollControllerTestPageState extends State<ScrollControllerTestPage> {
  final ScrollController _scrollController = ScrollController();

  bool isShowToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset >= 1000 && !isShowToTopBtn) {
        setState(() {
          isShowToTopBtn = true;
        });
      } else if (_scrollController.offset < 1000 && isShowToTopBtn) {
        setState(() {
          isShowToTopBtn = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollControllerTestPage'),
      ),
      body: ListView.separated(
          itemCount: 50,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              color: Colors.blue,
            );
          },
          controller: _scrollController,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          }),
      floatingActionButton: isShowToTopBtn
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              },
            )
          : null,
    );
  }
}
