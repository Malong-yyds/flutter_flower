import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text(
          "article",
          style: TextStyle(fontSize: 30),
        ),
      );
    
  }
}
