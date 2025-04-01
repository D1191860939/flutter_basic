import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListTestPage extends StatefulWidget {
  const AnimatedListTestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedListTestPageState();
  }
}

class _AnimatedListTestPageState extends State<AnimatedListTestPage> {
  List<String> data = [];
  int counter = 5;

  final GlobalKey<AnimatedListState> globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (int i = 0; i < counter; i++) {
      data.add("$i");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedListTestPage'),
      ),
      body: Stack(
        children: [
          AnimatedList(
              key: globalKey,
              initialItemCount: data.length,
              itemBuilder: (context, index, animation) => FadeTransition(
                    opacity: animation,
                    child: _buildItem(context, index),
                  )),
          _buildAddButton(context),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 30,
      child: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            data.add("${++counter}");
            globalKey.currentState!.insertItem(data.length - 1);
            print('添加 $counter');
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    String char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          setState(() {
            globalKey.currentState!.removeItem(
              index,
              (context, animation) {
                data.removeAt(index);
                print("删除 ${data[index]}");
                return FadeTransition(
                  opacity: CurvedAnimation(
                      parent: animation, curve: const Interval(0.5, 1.0)),
                  child: SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: 0,
                    child: _buildItem(context, index),
                  ),
                );
              },
              duration: const Duration(milliseconds: 200),
            );
          });
        },
      ),
    );
  }
}
