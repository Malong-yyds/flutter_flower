import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mine'),
      ),
      body: Center(
        child: Text(
          "mine",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
