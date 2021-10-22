import 'package:flutter/material.dart';
import 'package:ghibli/classes/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ghibli/pages/details2.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  fetchData() async {
    final response =
        await http.get(Uri.parse("https://ghibliapi.herokuapp.com/films"));
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body);
      return list;
    } else {
      throw Exception('Erreur de chargement');
    }
  }

  @override
  Widget build(BuildContext context) {
    var list = fetchData();
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: const Color(0xff242C34),
          body: FutureBuilder(
            future: list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final values = jsonEncode(snapshot.data);
                final data = jsonDecode(values);
                int numberOfFilms = data.length;
                return ListView.builder(
                  itemCount: numberOfFilms,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Details(data: data[index]),
                                  settings: RouteSettings(
                                    arguments: index,
                                  )));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          decoration: const BoxDecoration(
                            color: Color(0xff28313B),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 2, //spread radius
                                  blurRadius: 3, // blur radius
                                  offset: Offset(0, 0)),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                              left: 17, top: 12, bottom: 12, right: 17),
                          child: Row(children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 5, //spread radius
                                          blurRadius: 5, // blur radius
                                          offset: Offset(0, 2)),
                                    ],
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                      image: NetworkImage(
                                          "${data[index]['image']}"),
                                    ))),
                            Container(
                              margin: const EdgeInsets.only(left: 17),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data[index]['title']}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Open sans',
                                        fontSize: 19),
                                  ),
                                  Text(
                                    "${data[index]['director']}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Open sans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ));
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Image( image: AssetImage('lib/assets/images/waiting.gif'),);
            },
          ),
        ));
  }
}
