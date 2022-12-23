import 'package:demo1/near/navigation/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavigationTask extends StatelessWidget {
  const NavigationTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航使用'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('静态路由跳转'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/second')
                    .then((value) => print(value));
              },
            ),
            ElevatedButton(
              child: Text('动态路由跳转'),
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(content: '自定义数据')))
                    .then((value) => null);
              },
            ),
            ElevatedButton(
                child: Text('动画自定义路由跳转'),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, _, __) {
                    return SecondPage(content: '自定义数据2');
                  }, transitionsBuilder:
                          (_, Animation<double> animation, __, Widget child) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position:
                            Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                                .animate(animation),child: child,
                      ),
                    );
                  }));
                })
          ],
        ),
      ),
    );
  }
}
