import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TableTask extends StatelessWidget {
  const TableTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('table')),
      body: Center(
        child: Table(
          border: TableBorder.all(
              color: Colors.green, width: 2, style: BorderStyle.solid),
          columnWidths: {
            0: FixedColumnWidth(100),
            1: FixedColumnWidth(100),
            2: FixedColumnWidth(100)
          },
          children: [
            TableRow(children: [
              Text('姓名'),
              Text('性别'),
              Text('年龄'),
            ]),
             TableRow(children: [
              Text('张三'),
              Text('男'),
              Text('20'),
            ]),
             TableRow(children: [
              Text('里斯'),
              Text('女'),
              Text('18'),
            ]),
          ],
        ),
      ),
    );
  }
}
