import 'package:flutter/material.dart';
import 'package:ghibli/classes/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ghibli/pages/details.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
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

  Widget build(BuildContext context) {
    var list = fetchData();
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('title'),
          ),
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
                    return Card(
                      child: ListTile(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                        data: data[index],
                                      )))
                        },
                        title: Text("${data[index]['title']}"),
                        leading: Image(
                          image: NetworkImage("${data[index]['image']}"),
                          fit: BoxFit.cover,
                        ),
                        subtitle: Text("${data[index]['original_title']}"),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
