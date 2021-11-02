import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.data}) : super(key: key);
  var data;

  @override
  Widget build(BuildContext context) {
    var res = jsonEncode(data);
    var json = jsonDecode(res);
    double height = MediaQuery.of(context).size.height;
    double firstBlock = height * 0.30;
    double secondBlock = height - firstBlock;
    var characters =
        json['people'].forEach((dynamic character) => print(character));
    return SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: const Color(0xff242C34),
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: firstBlock,
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  )
                                ],
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(json['movie_banner']),
                                ),
                              ),
                              child: null),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.black.withOpacity(0),
                                  Colors.black.withOpacity(0.5),
                                ])),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 75, bottom: 5),
                              child: Text(
                                'Synopsis :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Open sans',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                            ),
                            Text(
                              json['description'],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                              Text('json[]')
                          ],
                        )),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      margin: EdgeInsets.only(left: 25, top: firstBlock - 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 5,
                          )
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('${json['image']}'),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: firstBlock,
                          margin: EdgeInsets.only(left: 15, right: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                json['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    letterSpacing: 0.5,
                                    fontFamily: 'Open Sans'),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  json['original_title'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  json['director'],
                                  style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                              Text(
                                json['release_date'],
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left),
                  ),
                )
              ],
            )));
  }
}
