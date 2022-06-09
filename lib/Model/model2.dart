class IplClass {
  String name;
  String matchtype;
  String result;
  String venue;
  String date;
  String id;
  String team1;
  String nameteam1, nameteam2;
  String url1, url2;
  String t1, t2;
  String team2;
  int r1, r2;
  int w1, w2;
  double o1, o2;
  String tosswinner;
  String choose;
  IplClass(
      {this.name = "Some name",
      this.matchtype = "Some name",
      this.result = "Some name",
      this.date = "Some name",
      this.id = "Some name",
      this.url1 = "random",
      this.url2 = "random",
      this.nameteam1 = "random",
      this.nameteam2 = "random",
      this.venue = "Some venue",
      this.team1 = "Random",
      this.team2 = "Random",
      this.r1 = 0,
      this.r2 = 0,
      this.t1 = "random",
      this.w1 = 0,
      this.w2 = 0,
      this.o1 = 0.0,
      this.t2 = "random",
      this.o2 = 0.0,
      this.tosswinner = "Random",
      this.choose = "Random"});
  factory IplClass.fromMap(Map ipl) {
    return IplClass(
        name: ipl['name'],
        matchtype: ipl['matchType'],
        venue: ipl['venue'],
        date: ipl['date'],
        result: ipl['status'],
        id: ipl['id'],
        tosswinner: ipl["tossWinner"],
        choose: ipl["tossChoice"],
        r1: ipl['score'][0]["r"],
        r2: ipl['score'][1]["r"],
        w1: ipl['score'][0]["w"],
        nameteam1: ipl["teamInfo"][0]["name"],
        nameteam2: ipl["teamInfo"][1]["name"],
        w2: ipl['score'][1]["w"],
        url1: ipl["teamInfo"][0]["img"],
        url2: ipl["teamInfo"][1]["img"],
        o1: (ipl['score'][0]["o"]).toDouble(),
        o2: (ipl['score'][1]["o"]).toDouble(),
        team1: ipl['score'][0]["inning"],
        team2: ipl['score'][1]["inning"]);
  }
}
