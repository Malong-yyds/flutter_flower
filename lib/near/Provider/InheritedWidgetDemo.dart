import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class InheritedWidgetDemo extends StatefulWidget {
//   @override
//   _InheritedWidgetDemoState createState() => _InheritedWidgetDemoState();
// }

// class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {

//  int _count = 0;
//  void _increaseCount(){
//    setState(() {
//      _count += 1;
//    });
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//          title: Text('InheritedWidget')
//      ),
//      body: MiddleCount(counter: _count,increaseCount: _increaseCount),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: _increaseCount,
//      ),
//    );
//  }
// }

// class MiddleCount extends StatelessWidget {

//   int counter = 0;
//   VoidCallback increaseCount;

//   MiddleCount({Key key, this.counter, this.increaseCount}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Counter(counter: counter,increaseCount: increaseCount),
//       ),
//     );
//   }
// }

// class Counter extends StatelessWidget {

//  int counter = 0;
//  VoidCallback increaseCount;

//  Counter({Key key, this.counter, this.increaseCount}) : super(key: key);

//  @override
//  Widget build(BuildContext context) {
//    return Center(
//        child: GestureDetector(
//          onTap: increaseCount,
//          child: Text(
//            '$counter',
//            style: TextStyle(fontSize: 30),
//          ),
//        )
//    );
//  }

// }


class InheritedWidgetDemo extends StatefulWidget {
  @override
  _InheritedWidgetDemoState createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {

 int _count = 0;
 void _increaseCount(){
   setState(() {
     _count += 1;
   });
 }

 @override
 Widget build(BuildContext context) {
   return CounterProvider(
     count: _count,
     increaseCount: _increaseCount,
     child: Scaffold(
      appBar: AppBar(
          title: Text('InheritedWidget')
      ),
      body: MiddleCount(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    )
   );
 }
}

class MiddleCount extends StatelessWidget {

  // int counter = 0;
  // VoidCallback increaseCount;

  // MiddleCount({Key key, this.counter, this.increaseCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatelessWidget {

 @override
 Widget build(BuildContext context) {

   final int count = CounterProvider.of(context)!.count;
   final VoidCallback increaseCount = CounterProvider.of(context)!.increaseCount;
   return Center(
       child: GestureDetector(
         onTap: increaseCount,
         child: Text(
           '$count',
           style: TextStyle(fontSize: 30),
         ),
       )
   );
 }
}

class CounterProvider extends InheritedWidget {

  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  const CounterProvider({super.key, 
    required this.count,
    required this.increaseCount,
    required this.child
  }) : super(child: child);

  static CounterProvider? of(BuildContext context) => 
    context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}