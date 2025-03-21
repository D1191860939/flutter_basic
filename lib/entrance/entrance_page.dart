import 'package:flutter/material.dart';
import 'package:hello_flutter/guess/guess_page.dart';
import 'package:hello_flutter/layout/test_layout_page.dart';
import 'package:hello_flutter/pavlova/pavlova_page.dart';
import 'package:hello_flutter/state/tap_box_page.dart';
import 'package:hello_flutter/ui/button_page.dart';
import 'package:hello_flutter/ui/checkbox_page.dart';
import 'package:hello_flutter/ui/image_page.dart';
import 'package:hello_flutter/ui/progress_page.dart';
import 'package:hello_flutter/ui/text_field_page.dart';
import 'package:hello_flutter/ui/text_page.dart';
import 'package:hello_flutter/wooden/wooden_fish_page.dart';
import 'package:hello_flutter/layout/test_row_column.dart';

import '../counter/counter_page.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

  Widget _buildItem(BuildContext context, String text, WidgetBuilder builder) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () =>
            {Navigator.of(context).push(MaterialPageRoute(builder: builder))},
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("测试入口")),
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildItem(context, "计数器", (context) => const MyHomePage()),
                  _buildItem(context, "猜数字", (context) => const GuessPage()),
                  _buildItem(context, "官网 Layout Introduction",
                      (context) => Pavlovapage()),
                  _buildItem(
                      context, "电子木鱼", (context) => const WoodenFishPage()),
                  _buildItem(
                      context, "Flutter 实战-状态管理", (context) => TapBoxPage()),
                  _buildItem(
                      context, "Flutter 实战-文本及样式", (context) => TextPage()),
                  _buildItem(
                      context, "Flutter 实战-按钮", (context) => ButtonPage()),
                  _buildItem(
                      context, "Flutter 实战-图片及 Icon", (context) => ImagePage()),
                  _buildItem(context, "Flutter 实战-单选开关和复选框",
                      (context) => CheckboxPage()),
                  _buildItem(
                      context, "Flutter 实战-输入框", (context) => TextFieldPage()),
                  _buildItem(
                      context, "Flutter 实战-进度条", (context) => ProgressPage()),
                  _buildItem(context, "Flutter 实战-布局测试1",
                      (context) => const TestLayoutPage()),
                  _buildItem(context, "Flutter 实战-布局测试2",
                      (context) => const TestRowColumnPage()),
                ],
              ),
            )));
  }
}
