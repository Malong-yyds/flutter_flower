import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FindScreen extends StatelessWidget {
  const FindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('find'),
      ),
      body: Center(
        child: Text(
          "find",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
