import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int _counter = 0;
  final Random _random = Random();

  void _generateRandomNumber() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = _random.nextInt(100);
    });
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
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.run_circle_outlined,
              color: Colors.blue,
            ),
            onPressed: () {},
            splashRadius: 20,
          )
        ],
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xfff3f6f9),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide.none,
              ),
              hintText: "输入 0~99 数字",
              hintStyle: TextStyle(fontSize: 14)),
        ),
      ),
      body: Stack(
          children: [
            Column(children: [

            ],),
            Column(
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
                const Text(
                  '点击生成随机数值',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            )
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomNumber,
        tooltip: 'Increment',
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.generating_tokens_outlined,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
