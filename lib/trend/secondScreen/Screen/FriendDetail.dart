import 'package:demo1/trend/secondScreen/Model/friend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FriendDetail extends StatelessWidget {

const FriendDetail(this.friend,this.avatarTag, {super.key});

final Friend friend;
final Object avatarTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
      child: Hero(tag: this.avatarTag, child: Image.network(friend.avatar,
      fit: BoxFit.fitWidth,),),
      constraints: BoxConstraints.expand(),
    ),
    onTap: () {
      Navigator.of(context).pop();
    },
      ),
    );
  }
}