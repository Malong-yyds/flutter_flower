// ignore_for_file: deprecated_member_use

import 'package:demo1/Home.dart';
import 'package:demo1/Welcome.dart';
import 'package:demo1/near/navigation/secondPage.dart';
import 'package:demo1/near/navigation/thirdPAge.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// final ThemeData IOSTheme =
//     ThemeData(primaryColor: Colors.orange, accentColor: Colors.green);

// final ThemeData AndTheme = ThemeData(
//     primaryColor: Colors.purple, accentColor: Colors.orangeAccent[400]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       theme: ThemeData(
          // primarySwatch: Colors.white,
          primaryColor: Colors.white
        ),
      // theme: ThemeData(
      //   colorScheme: const ColorScheme.light(
      //       primary: Colors.white,
      //       // onPrimary: Colors.white,
      //       // onBackground: Colors.white,
      //       secondary: Colors.amber),
      // ),

      // theme: defaultTargetPlatform == TargetPlatform.iOS ? IOSTheme : AndTheme,
      home: WelcomePage(),
      routes: {
        '/second':(context) {
          return SecondPage(content: '4321',);
        },
         '/third':(context) {
          return ThirdPage();
        },
      },
    );
  }
}
