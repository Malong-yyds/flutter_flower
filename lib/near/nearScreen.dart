import 'package:demo1/near/Provider/Provider.dart';
import 'package:demo1/near/navigation/navigationTask.dart';
import 'package:demo1/near/scrollComponent/TableTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NearScreen extends StatefulWidget {
  // const NearScreen({super.key});

  @override
  State<NearScreen> createState() => _NearScreenState();
}

class _NearScreenState extends State<NearScreen> {
// 数据持久化
  void saveSomething() async {
    final preference = await SharedPreferences.getInstance();
    preference.setString('localKey', 'LocalData');
  }

  void getSomething() async {
    final preference = await SharedPreferences.getInstance();
    var result = preference.getString('localKey');
    print(result);
  }

  @override
  void initState() {
    saveSomething();
   getSomething();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('near'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavigationTask()));
              }),
              child: Text('导航学习')),
               ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TableTask()));
              }),
              child: Text('table学习')),
               ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProviderTask()));
              }),
              child: Text('provider学习')),
          // Text('传入的参数${content}',style: TextStyle(fontSize: 20,color: Colors.red),)
        ],
      )
      ),
    );
  }
}
