class IplQueryModel {
  String name;
  String matchtype;
  String result;
  String venue;
  String date;
  String id;
  String url1, url2;
  String team1;
  String team2;
  IplQueryModel(
      {this.name = "Some name",
      this.matchtype = "Some name",
      this.result = "Some name",
      this.date = "Some name",
      this.id = "Some name",
      this.venue = "Some venue",
      this.url1 = ",fnk",
      this.url2 = ":lkf",
      this.team1 = "Random",
      this.team2 = "Random"});
  factory IplQueryModel.fromMap(Map ipl) {
    return IplQueryModel(
        name: ipl['name'],
        matchtype: ipl['matchType'],
        venue: ipl['venue'],
        date: ipl['date'],
        result: ipl['status'],
        id: ipl['id'],
        url1: ipl["teamInfo"][0]["img"],
        url2: ipl["teamInfo"][1]["img"],
        team1: ipl["teamInfo"][0]["name"],
        team2: ipl["teamInfo"][1]["name"]);
  }
}
