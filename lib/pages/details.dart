import 'dart:convert';

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
        top: true,
        child: Scaffold(
          backgroundColor: const Color(0xff242C34),
          body: Column(
            children: [
              Stack(
                children: [
                  Image(
                      height: 240,
                      fit: BoxFit.cover,
                      image: NetworkImage('${json['movie_banner']}')),
                  Container(
                    height: 240,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment(0.0, 0.0),
                            colors: <Color>[
                              Color(0x00000000),
                              Color(0x29010AFF),
                            ])),
                  ),
                  Container(
                      height: 141,
                      margin: const EdgeInsets.only(top: 170, left: 25),
                      child: Row(
                        children: [
                          Container(
                            width: 91,
                            height: 124,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomCenter,
                                    image: NetworkImage('${json['image']}')),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 5, //spread radius
                                      blurRadius: 7, // blur radius
                                      offset: Offset(0, 2)),
                                ]),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${json['title']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Open sans',
                                      ),
                                    ),
                                    Text(
                                      '${json['original_title']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Open sans',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        json['director'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 19,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      margin: EdgeInsets.only(bottom: 5),
                                    ),
                                    Text(
                                      json['release_date'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 14, left: 25, right: 25),
                child: Text(
                  json['description'],
                  style: const TextStyle(
                      color: Colors.white,
                    fontFamily: 'roboto',
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
