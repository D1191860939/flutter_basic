import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  TextEditingController _nameEditController = TextEditingController();
  TextEditingController _pwdEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameEditController,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                prefixIcon: Icon(Icons.person),
                hintText: "用户名或邮箱"),
          ),
          TextField(
            controller: _pwdEditController,
            decoration: InputDecoration(
              labelText: "密码",
              prefixIcon: Icon(Icons.lock),
              hintText: "您的登录密码",
            ),
            obscureText: true,
          ),
          ElevatedButton(onPressed: () {
            print("name = ${_nameEditController.text}, pwd = ${_pwdEditController.text}");
          }, child: Text("登录"))
        ],
      ),
    );
  }
}
