import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片及 Icon"),
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage("assets/images/avatar.png"),
            width: 100,
          ),
          Image.asset(
            "assets/images/avatar.png",
            width: 100,
          ),
          Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4", width: 100,)
        ],
      ),
    );
  }
}
