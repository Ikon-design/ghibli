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

  const Data(
    this.id,
    this.title,
    this.original_title,
    this.original_title_romanised,
    this.image,
    this.movie_banner,
    this.description,
    this.director,
    this.producer,
    this.release_date,
    this.running_time,
    this.rt_score,
    this.people,
    this.species,
    this.locations,
    this.vehicles,
    this.url,
  );
}
