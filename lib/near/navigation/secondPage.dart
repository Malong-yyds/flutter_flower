import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatefulWidget {
  final String content;
// SecondPage({ this.content});
  const SecondPage({super.key, required this.content});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('数据');
              },
              child: Text('返回1')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/third');
                
              },
              child: Text('返回2')),
              // 存在切换过程
                ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/third');
                
              },
              child: Text('返回3')),
                ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context,ModalRoute.withName('/'));
                
              },
              child: Text('返回4')),
          Text(
            '传入的参数${widget.content != null ? widget.content : ""}',
            style: TextStyle(color: Colors.red, fontSize: 20),
          )
        ],
      )),
    );
  }
}
