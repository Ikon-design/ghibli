import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Data> fetchData() async{
  final response = await http.get(Uri.parse("https://ghibliapi.herokuapp.com/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"));
  if (response.statusCode == 200){
    return Data.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Erreur de chargement');
  }
}

class Data {
  final String id;
  final String title;
  final String original_title;
  final String original_title_romanised;
  final String image;
  final String movie_banner;
  final String description;
  final String director;
  final String producer;
  final String release_date;
  final String running_time;
  final String rt_score;
  final List people;
  final List species;
  final List locations;
  final List vehicles;
  final String url;

  Data({
    required this.id,
    required this.title,
    required this.original_title,
    required this.original_title_romanised,
    required this.image,
    required this.movie_banner,
    required this.description,
    required this.director,
    required this.producer,
    required this.release_date,
    required this.running_time,
    required this.rt_score,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
        id: json['id'],
        title: json['title'],
        original_title: json['original_title'],
        original_title_romanised: json['original_title_romanised'],
        image: json['image'],
        movie_banner: json['movie_banner'],
        description: json['description'],
        director: json['director'],
        producer: json['producer'],
        release_date: json['release_date'],
        running_time: json['running_time'],
        rt_score: json['rt_score'],
        people: json['people'],
        species: json['species'],
        locations: json['locations'],
        vehicles: json['vehicles'],
        url: json['url'],
    );
  }
}
