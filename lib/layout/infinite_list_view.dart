import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  @override
  State createState() {
    return _InfiniteState();
  }
}

class _InfiniteState extends State<InfiniteListView> {
  static const String loadingTag = "##loading##";

  List<String> _words = [loadingTag];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) => Divider(
              height: .0,
            ),
        itemCount: _words.length);
  }

  void _retrieveData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
    });
  }
}
