import 'package:flutter/material.dart';

class PaddingTestPage extends StatelessWidget {
  const PaddingTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Padding'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text("Hello world"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text("I am Jack"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text("I am John"),
              ),
              DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange.shade700]),
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 4)
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ));
  }
}
