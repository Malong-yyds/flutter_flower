import 'package:demo1/near/Provider/InheritedWidgetDemo.dart';
import 'package:demo1/near/Provider/ScopedModelDemo.dart';
import 'package:demo1/near/Provider/providerDemo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProviderTask extends StatelessWidget {
  const ProviderTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('near'),
      ),
      body: Center(
          child: Column(
        children: [
          // ElevatedButton(
          //     onPressed: (() {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => InheritedWidgetDemo()));
          //     }),
          //     child: Text('InheritedWidget')),
               ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScopedModelDemo()));
              }),
              child: Text('ScopedModel')),
               ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProviderDemo()));
              }),
              child: Text('Provider')),
          // Text('传入的参数${content}',style: TextStyle(fontSize: 20,color: Colors.red),)
        ],
      )
      ),
    );
  }
}