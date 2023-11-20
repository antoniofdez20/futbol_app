import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:futbol_app/models/models.dart';

class TeamsProvider extends ChangeNotifier {
  final String _baseUrl = 'thesportsdb.com';
  List<League> ondisplayLeagues = [];
  List<Team> ondisplayTeams = [];
  League? selectedLeague;
  String?
      _selectedLeagueName; //guardara el nombre de la liga adaptado para poder hacer la consulta correctamente a la api

  TeamsProvider() {
    //print('Teams provider inicialitzat');
    getOnDisplayLeagues();
  }

  getOnDisplayLeagues() async {
    //print('Leagues');
    var url = Uri.https(_baseUrl, 'api/v1/json/3/all_leagues.php');

    final result = await http.get(url);

    final leaguesResponse = LeaguesResponse.fromJson(result.body);

    ondisplayLeagues = leaguesResponse.leagues
        .where((league) =>
            ["4328", "4331", "4332", "4334", "4335"].contains(league.idLeague))
        .toList();

    assignImageUrls();

    notifyListeners();
  }

  // como la respuesta de la api en este caso no me devuelve un campo con imagen url se lo asigno manualmente
  void assignImageUrls() {
    for (var league in ondisplayLeagues) {
      league.imageUrl = getImageUrlLeague(league.idLeague);
    }
  }

  String getImageUrlLeague(String leagueId) {
    switch (leagueId) {
      case "4328":
        return "https://1000logos.net/wp-content/uploads/2017/05/Premier-League-Logo-2007.jpg";
      case "4331":
        return "https://elsrcorchea.com/wp-content/uploads/2023/08/German-Bundesliga-logo1.jpg";
      case "4332":
        return "https://1000logos.net/wp-content/uploads/2019/01/Italian-Serie-A-Logo.jpg";
      case "4334":
        return "https://1000marcas.net/wp-content/uploads/2020/03/French-Ligue-1-Logo-2020.png";
      case "4335":
        return "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2023/06/03/16857929786160.jpg";
      default:
        return "https://via.placeholder.com/300x400";
    }
  }

  void setSelectedLeague(League league) async {
    selectedLeague = league;

    _selectedLeagueName = selectedLeague?.strLeague.replaceAll(" ", "_");

    await getOnDisplayTeams(_selectedLeagueName!);

    notifyListeners();
  }

  Future<void> getOnDisplayTeams(String leagueName) async {
    var url = Uri.https(
        _baseUrl, 'api/v1/json/3/search_all_teams.php', {'l': leagueName});

    final result = await http.get(url);

    final teamsResponse = TeamsResponse.fromJson(result.body);

    ondisplayTeams = teamsResponse.teams;
  }
}
