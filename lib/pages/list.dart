import 'package:flutter/material.dart';
import 'package:ghibli/widget/video.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('List'),
            
          ),
      body: Text('Test'),
    ));
  }
}
