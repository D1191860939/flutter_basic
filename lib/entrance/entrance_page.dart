import 'package:flutter/material.dart';
import 'package:hello_flutter/guess/guess_page.dart';
import 'package:hello_flutter/pavlova/pavlova_page.dart';

import '../counter/counter_page.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

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
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const MyHomePage(title: "计数器")))
                      },
                      child: const Text("计数器"),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const GuessPage(title: "猜数字")))
                      },
                      child: const Text("猜数字"),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Pavlovapage()));
                      },
                      child: const Text("官网 Layout Introduction"),
                    ),
                  )
                ],
              ),
            )));
  }
}
