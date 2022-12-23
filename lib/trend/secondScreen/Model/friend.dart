import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';

class Friend {
  @required
  final String avatar;
  @required
  final String name;
  @required
  final String email;

  // 构造函数
  Friend({required this.avatar, required this.name, required this.email});

  // 将jsonString 转换成List<Friend>
  static List<Friend> resolveDataFromReponse(String resolveData) {
    var json = jsonDecode(resolveData);
    var results = json['results'];
    var result =
        results.map((obj) => Friend.fromMap(obj)).toList().cast<Friend>();
    return result;
  }

  static Friend fromMap(Map map) {
    var name = map['name'];

    return Friend(
        avatar: map['picture']['large'],
        name: '${name['first']} ${name['second']} ',
        email: map['email']);
  }
}
