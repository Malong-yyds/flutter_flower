// ignore_for_file: unused_field

import 'dart:async';

import 'package:demo1/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = new Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
            builder: (context) => FlowerApp(),
          ),
          (route) => route == null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.only(top: 280.0),
        child: Column(
          children: [
            Text(
              '暂定欢迎页',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
