import 'package:flutter/material.dart';

class SecPage extends StatefulWidget {
  SecPage({
    Key? key,
    required this.page1text,
  }) : super(key: key);

  String page1text;

  @override
  State<SecPage> createState() => _SecPageState();
}

class _SecPageState extends State<SecPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGE 2"),
      ),
      body: Center(child: Text("VVVV : ${widget.page1text}")),
    );
  }
}
