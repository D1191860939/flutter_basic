import 'package:flutter/material.dart';

/*
  1. @immutable 代表 Widget 是不可变的，这会限制 Widget 中定义的属性都是不可变的，即 final的。
     因为 Flutter 中如果属性发生变化就会重新创建 Widget 树，用新创建 Widget 实例来替换旧的 Widget
     实例，所以允许 Widget 的属性变化是没有意义的。

  2.
 */
class WoodenFishPage extends StatelessWidget {
  const WoodenFishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      elevation: 0,
      minimumSize: const Size(36, 36),
      padding: EdgeInsets.zero,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        // centerTitle: true,
        title: const Text(
          "电子木鱼",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.history,
                color: Colors.black,
              ))
        ],
      ),
      body: Stack(
        // alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "功德数: 0",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Container(
                    width: 200,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/muyu.png")),
                  )
                ]),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: Wrap(
                spacing: 8,
                direction: Axis.vertical,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: style,
                    child: const Icon(Icons.music_note_outlined,
                        color: Colors.white),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: style,
                      child: Icon(Icons.image, color: Colors.white))
                ],
              )),
          // Container(
          //   margin: const EdgeInsets.only(top: 10, right: 10),
          //   child: Column(
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {},
          //         style: style,
          //         child: const Icon(Icons.music_note_outlined,
          //             color: Colors.white),
          //       ),
          //       ElevatedButton(
          //           onPressed: () {},
          //           style: style,
          //           child: Icon(Icons.image, color: Colors.white))
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
