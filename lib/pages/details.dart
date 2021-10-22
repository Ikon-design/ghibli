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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image(
                        height: 240,
                        fit: BoxFit.cover,
                        image: NetworkImage('${json['movie_banner']}')),
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0.0, -1.0),
                              end: Alignment(0.0, 1.0),
                              colors: <Color>[
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.7),
                          ])),
                    ),
                    Container(
                        //height: 141,
                        margin: const EdgeInsets.only(
                            top: 170, left: 25, right: 25),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                width: 91,
                                height: 124,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        image:
                                            NetworkImage('${json['image']}')),
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 5, //spread radius
                                          blurRadius: 7, // blur radius
                                          offset: Offset(0, 2)),
                                    ]),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Text(
                                              '${json['title']}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Open sans',
                                                  fontSize: 19,
                                                  overflow: TextOverflow.clip),
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
                                  ),
                                  Flexible(
                                      child: Container(
                                    margin: const EdgeInsets.only(left: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  )),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0.0,
                            enableFeedback: true,
                          ),
                          icon: Icon(Icons.chevron_left),
                          label: Text(
                            'retour',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
              Flexible(
                  child: Container(
                margin: EdgeInsets.only(top: 14, left: 25, right: 25),
                child: Text(
                  json['description'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'roboto',
                  ),
                ),
              )),
            ],
          ),
        ));
  }
}
