import 'models.dart';

class LeaguesResponse {
  List<League> leagues;

  LeaguesResponse({
    required this.leagues,
  });

  factory LeaguesResponse.fromJson(String str) =>
      LeaguesResponse.fromMap(json.decode(str));

  factory LeaguesResponse.fromMap(Map<String, dynamic> json) => LeaguesResponse(
        leagues:
            List<League>.from(json["leagues"].map((x) => League.fromMap(x))),
      );
}

class League {
  String idLeague;
  String strLeague;
  String strSport;
  String strLeagueAlternate;
  String
      imageUrl; //variable adicional para mostrar una imagen url añadida manualmente ya que la respuesta no lo proporciona

  League(
      {required this.idLeague,
      required this.strLeague,
      required this.strSport,
      required this.strLeagueAlternate,
      this.imageUrl = 'https://via.placeholder.com/300x400'});

  factory League.fromJson(String str) => League.fromMap(json.decode(str));

  factory League.fromMap(Map<String, dynamic> json) => League(
        idLeague: json["idLeague"],
        strLeague: json["strLeague"],
        strSport: json["strSport"],
        strLeagueAlternate: json["strLeagueAlternate"],
        imageUrl: json["imageUrl"] ?? 'https://via.placeholder.com/300x400',
      );
}
