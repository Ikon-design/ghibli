import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghibli/classes/data.dart';

class Details extends StatefulWidget {
  final Data data;
  Details({required this.data});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text('title'),
          ),
          body: Text('coucu')),
    );
  }
}
