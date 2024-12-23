import 'package:flutter/material.dart';
import 'package:hello_flutter/state/tap_box_a.dart';

class TapBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("状态管理")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [TapBoxA()],
        ),
      ),
    );
  }
}
