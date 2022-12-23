import 'package:demo1/Mine/mineScreen.dart';
import 'package:demo1/find/findScreen.dart';
import 'package:demo1/identify/identifyScreen.dart';
import 'package:demo1/near/nearScreen.dart';
import 'package:demo1/trend/trendScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlowerApp extends StatefulWidget {
  const FlowerApp({super.key});

  @override
  State<FlowerApp> createState() => _FlowerAppState();
}

class _FlowerAppState extends State<FlowerApp> {

final List<Widget> _chilren=[
TrendScreen(),
NearScreen(),
IdentifyScreen(),
FindScreen(),
MineScreen()
];

int _currentindex=0;


void onTapAction(int index){
  setState(() {
    _currentindex=index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _chilren[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentindex,
        onTap: onTapAction,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.filter), label: "动态"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: "附近"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.indeterminate_check_box), label: "识别"),
                  const BottomNavigationBarItem(
                icon: Icon(Icons.find_in_page), label: "发现"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "我的"),
           
        ]),
    );
  }
}