import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮及样式"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "normal");
              },
              child: Text("normal")),
          TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "submit");
              },
              child: Text("Submit")),
          OutlinedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "outline");
              },
              child: Text("outline")),
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "点赞");
              },
              icon: Icon(Icons.thumb_up)),
          ElevatedButton.icon(
            onPressed: () {
              Fluttertoast.showToast(msg: "发送");
            },
            label: Text("发送"),
            icon: Icon(Icons.send),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Fluttertoast.showToast(msg: "添加");
            },
            label: Text("添加"),
            icon: Icon(Icons.add),
          ),
          TextButton.icon(
            onPressed: () {
              Fluttertoast.showToast(msg: "详情");
            },
            label: Text("详情"),
            icon: Icon(Icons.info),
          )
        ],
      ),
    );
  }
}
