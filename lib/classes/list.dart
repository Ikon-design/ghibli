import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchDatas() async{
  final response = await http.get(Uri.parse("https://ghibliapi.herokuapp.com/films"));
  if (response.statusCode == 200){
    final List list = jsonDecode(response.body);
    print(list);
    return list;
  }else{
    throw Exception('Erreur de chargement');
  }
}

class List {
}
