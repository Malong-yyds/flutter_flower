import 'dart:convert';
import 'dart:io';

import 'package:demo1/trend/secondScreen/Model/friend.dart';
import 'package:demo1/trend/secondScreen/Screen/FriendDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Friend> _friends = [];
  var url = "https://randomuser.me/api/?results=40";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFriendsData();
  }

  _loadFriendsData() async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    var jsonString = await response.transform(utf8.decoder).join();

    setState(() {
      _friends = Friend.resolveDataFromReponse(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView.builder(
            itemCount: _friends.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: ((context, index) {
              Friend friend = _friends[index];
              return InkWell(
                child: Card(
                  child: Hero(tag: index, child: Image.network(friend.avatar),),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(PageRouteBuilder(pageBuilder: ((context, _, __) {
                    return FriendDetail(friend,index);
                  })));
                },
              );
            }))
            );
  }
}
