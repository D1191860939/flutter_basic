import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_flutter/guess/answer_status.dart';
import 'package:hello_flutter/guess/guess_appbar.dart';
import 'package:hello_flutter/guess/result_notice.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int _value = 0;
  final Random _random = Random();
  AnswerStatus _answerStatus = AnswerStatus.notStart;
  final TextEditingController _controller = TextEditingController();

  void _generateRandomNumber() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _value = _random.nextInt(100);
      _answerStatus = AnswerStatus.init;
    });
  }

  Widget _buildGreyArea() {
    return Expanded(
        child: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            constraints: const BoxConstraints(minWidth: double.infinity)));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: GuessAppbar(
          controller: _controller,
          onCheck: () {
            if (_answerStatus == AnswerStatus.notStart) {
              return;
            }
            int? inputValue = int.tryParse(_controller.text);
            if (inputValue == null) {
              return;
            }

            setState(() {
              if (inputValue > _value) {
                _answerStatus = AnswerStatus.greater;
              } else if (inputValue < _value) {
                _answerStatus = AnswerStatus.less;
              } else {
                _answerStatus = AnswerStatus.equal;
              }
            });
          }),
      body: Stack(
        children: [
          Column(
            children: [
              if (_answerStatus == AnswerStatus.greater)
                ResultNotice(color: Colors.redAccent, info: "大了"),
              if (_answerStatus == AnswerStatus.greater ||
                  _answerStatus == AnswerStatus.less)
                _buildGreyArea(),
              if (_answerStatus == AnswerStatus.less)
                ResultNotice(color: Colors.blueAccent, info: "小了"),
            ],),
          Center(
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_answerStatus == AnswerStatus.notStart)
                  const Text('点击生成随机数值'),
                Text(
                  _answerStatus == AnswerStatus.notStart ||
                          _answerStatus == AnswerStatus.equal
                      ? '$_value'
                      : "**",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _answerStatus == AnswerStatus.notStart
            ? _generateRandomNumber
            : null,
        tooltip: 'Increment',
        backgroundColor:
            _answerStatus == AnswerStatus.notStart ? Colors.blue : Colors.grey,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.generating_tokens_outlined,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
