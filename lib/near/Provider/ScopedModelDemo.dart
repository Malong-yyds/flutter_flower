import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelDemo extends StatefulWidget {
  @override
  _ScopedModelDemoState createState() => _ScopedModelDemoState();
}

class _ScopedModelDemoState extends State<ScopedModelDemo> {


 @override
 Widget build(BuildContext context) {
   return ScopedModel(
     model: CounterModel(), 
     child: Scaffold(
        appBar: AppBar(
            title: Text('ScopedModel')
        ),
        body: MiddleCount(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, child, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model._increaseCount,
          ),
        )
      )
    );
 }
}

class MiddleCount extends StatelessWidget {

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
   return ScopedModelDescendant<CounterModel>(
     builder: (context, child, model) => Center(
       child: GestureDetector(
         onTap: model._increaseCount,
         child: Text(
           '${model.count}',
           style: TextStyle(fontSize: 30),
         ),
       )
      ),
    );
 }

}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void _increaseCount(){
    _count += 1;
    notifyListeners();
  }

}