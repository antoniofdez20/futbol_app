import 'models.dart';

class TeamsResponse {
  List<Team> teams;

  TeamsResponse({
    required this.teams,
  });

  factory TeamsResponse.fromJson(String str) =>
      TeamsResponse.fromMap(json.decode(str));

  factory TeamsResponse.fromMap(Map<String, dynamic> json) => TeamsResponse(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromMap(x))),
      );
}

class Team {
  String idTeam;
  String strTeam;
  String strAlternate;
  String intFormedYear;
  String strSport;
  String strLeague;
  String idLeague;
  String strStadium;
  String strKeywords;
  String? strStadiumThumb;
  String strStadiumDescription;
  String strStadiumLocation;
  String intStadiumCapacity;
  String strWebsite;
  String strFacebook;
  String strTwitter;
  String strInstagram;
  String strDescriptionEn;
  String? strDescriptionEs;
  String strKitColour1;
  String strKitColour2;
  String strKitColour3;
  String strCountry;
  String strTeamBadge;
  String strTeamJersey;
  String? strTeamLogo;
  String? strTeamFanart1;
  String? strTeamFanart2;
  String? strTeamFanart3;
  String? strTeamFanart4;
  String? strTeamBanner;
  String strYoutube;
  String strLocked;

  Team({
    required this.idTeam,
    required this.strTeam,
    required this.strAlternate,
    required this.intFormedYear,
    required this.strSport,
    required this.strLeague,
    required this.idLeague,
    required this.strStadium,
    required this.strKeywords,
    required this.strStadiumThumb,
    required this.strStadiumDescription,
    required this.strStadiumLocation,
    required this.intStadiumCapacity,
    required this.strWebsite,
    required this.strFacebook,
    required this.strTwitter,
    required this.strInstagram,
    required this.strDescriptionEn,
    required this.strDescriptionEs,
    required this.strKitColour1,
    required this.strKitColour2,
    required this.strKitColour3,
    required this.strCountry,
    required this.strTeamBadge,
    required this.strTeamJersey,
    required this.strTeamLogo,
    required this.strTeamFanart1,
    required this.strTeamFanart2,
    required this.strTeamFanart3,
    required this.strTeamFanart4,
    required this.strTeamBanner,
    required this.strYoutube,
    required this.strLocked,
  });

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        idTeam: json["idTeam"],
        strTeam: json["strTeam"],
        strAlternate: json["strAlternate"],
        intFormedYear: json["intFormedYear"],
        strSport: json["strSport"],
        strLeague: json["strLeague"],
        idLeague: json["idLeague"],
        strStadium: json["strStadium"],
        strKeywords: json["strKeywords"],
        strStadiumThumb: json["strStadiumThumb"],
        strStadiumDescription: json["strStadiumDescription"],
        strStadiumLocation: json["strStadiumLocation"],
        intStadiumCapacity: json["intStadiumCapacity"],
        strWebsite: json["strWebsite"],
        strFacebook: json["strFacebook"],
        strTwitter: json["strTwitter"],
        strInstagram: json["strInstagram"],
        strDescriptionEn: json["strDescriptionEN"],
        strDescriptionEs: json["strDescriptionES"],
        strKitColour1: json["strKitColour1"],
        strKitColour2: json["strKitColour2"],
        strKitColour3: json["strKitColour3"],
        strCountry: json["strCountry"],
        strTeamBadge: json["strTeamBadge"],
        strTeamJersey: json["strTeamJersey"],
        strTeamLogo: json["strTeamLogo"],
        strTeamFanart1: json["strTeamFanart1"],
        strTeamFanart2: json["strTeamFanart2"],
        strTeamFanart3: json["strTeamFanart3"],
        strTeamFanart4: json["strTeamFanart4"],
        strTeamBanner: json["strTeamBanner"],
        strYoutube: json["strYoutube"],
        strLocked: json["strLocked"],
      );
}
