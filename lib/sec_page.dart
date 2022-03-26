import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SEC PAGE")),
      body: Center(
          child: RaisedButton(
        onPressed: () {},
        child: Text("GO HOME"),
      )),
    );
  }
}
