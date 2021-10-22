import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghibli/pages/details.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.data}) : super(key: key);
  var data;

  @override
  Widget build(BuildContext context) {
    var res = jsonEncode(data);
    var json = jsonDecode(res);
    return SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: const Color(0xff242C34),
            body: Stack(children: [
              Column(
                children: [
                  Flexible(
                      flex: 35,
                      child:
                          Container(color: Colors.blue, decoration: BoxDecoration(
                            image: DecorationImage)
                          ),),
                      //Column(
                      //  children: [
                      //    Image(
                      //        fit: BoxFit.cover,
                      //        image: NetworkImage('${json['movie_banner']}')),
                      //  ],
                      //)),
                  Flexible(
                      flex: 75,
                      child: Container(
                        color: Colors.red,
                      ))
                ],
              )
            ])));
  }
}
