import 'package:demo1/trend/secondScreen/Screen/articleScreen.dart';
import 'package:demo1/trend/secondScreen/Screen/idScreen.dart';
import 'package:demo1/trend/secondScreen/Screen/noteScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TrendScreen extends StatelessWidget {
    TrendScreen({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: _getSearchBar(),
          actions: [
            IconButton(onPressed: (() {
              
            }), icon: Icon(Icons.add),color: Colors.grey,iconSize: 28,)
          ],
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Material(
                    color: Colors.white,
                    child: TabBar(
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        indicatorWeight: 2,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(fontSize: 16),
                        tabs: [
                          Tab(
                            text: '花记',
                          ),
                          Tab(
                            text: '鉴定',
                          ),
                          Tab(
                            text: '文章',
                          ),
                        ]),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: TabBarView(
                      children: [NoteScreen(), IDSScreen(), ArticleScreen()],
                    ))
              ],
            )));
  }

  Widget _getSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey, width: 3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  // contentPadding: EdgeInsets.only(top: -10),
                  hintText: "搜索花记/百科/鉴定/文章",
                  border: InputBorder.none),
            ),
          )),
          IconButton(onPressed: () {
            _controller.clear();
          }, icon: Icon(Icons.cancel))
        ],
      ),
    );
  }
}
