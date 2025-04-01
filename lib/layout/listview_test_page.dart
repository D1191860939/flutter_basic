import 'package:flutter/material.dart';
import 'package:hello_flutter/layout/infinite_list_view.dart';

class ListViewTestPage extends StatelessWidget {
  const ListViewTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.green,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('ListviewTestPage'),
        ),
        body: InfiniteListView());
    // ListView.separated(
    //     itemCount: 50,
    //     separatorBuilder: (context, index) {
    //       return index % 2 == 0 ? divider1 : divider2;
    //     },
    //     itemBuilder: (context, index) {
    //       return ListTile(title: Text('item $index'));
    //     }));
  }
}
