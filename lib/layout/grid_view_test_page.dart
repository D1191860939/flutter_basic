import 'package:flutter/material.dart';

class GridViewTestPage extends StatefulWidget {

  const GridViewTestPage({super.key});

  @override
  State createState() {
    return _GridViewTestPageState();
  }
}

class _GridViewTestPageState extends State<GridViewTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridViewTestPage'),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1),
          children: const [
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ));
  }
}
