import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ipl_app/Model/model.dart';
import 'package:ipl_app/Model/model2.dart';
import 'package:ipl_app/adapter.dart';
import 'package:ipl_app/screens/details.dart';

class New extends StatefulWidget {
  New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  List<IplQueryModel> ipl = <IplQueryModel>[];
  List<IplQueryModel> ipl2 = <IplQueryModel>[];

  String url =
      "https://api.cricapi.com/v1/series_info?apikey=576f1519-a1f2-4b9a-9d55-e37bf0538028&offset=0&id=47b54677-34de-4378-9019-154e82b9cc1a";
  getresponse() async {
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    Map dataa = data['data'];

    setState(() {
      dataa["matchList"].forEach((element) {
        IplQueryModel iplQueryModel = new IplQueryModel();
        iplQueryModel = IplQueryModel.fromMap(element);
        ipl.add(iplQueryModel);
        ipl2.add(iplQueryModel);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    AdpterIpl adpterIpl = AdpterIpl();
    adpterIpl.getdata();
    getresponse();

    super.initState();
  }

  Widget buidsearch() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 29, 9, 250),
              size: 35,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    ipl = ipl2;
                  });
                  if (value.isEmpty) {
                    setState(() {
                      ipl = ipl2;
                    });
                  } else {
                    final books = ipl.where((element) {
                      final titlelower = element.name.toLowerCase();
                      return titlelower.contains(value.toLowerCase());
                    }).toList();
                    print(books);

                    if (books.isNotEmpty) {
                      setState(() {
                        ipl = books;
                      });
                    } else {
                      setState(() {
                        ipl = ipl2;
                      });
                    }
                  }
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.all(8)),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IPL ScoreBoard",
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 81, 255),
      ),
      body: Column(
        children: [
          buidsearch(),
          Expanded(
            child: ListView.builder(
                itemCount: ipl.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String urlee =
                          "https://api.cricapi.com/v1/match_info?apikey=576f1519-a1f2-4b9a-9d55-e37bf0538028&offset=0&id=${ipl[index].id}";
                      getresponsesss(urlee, index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(1),
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.white,
                        elevation: 20,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(
                                    ipl[index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Text(ipl[index].matchtype),
                                    color: Color.fromARGB(255, 177, 108, 4),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                ipl[index].team1 + " and " + ipl[index].team2,
                                style: const TextStyle(
                                    color: Color.fromARGB(232, 255, 90, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        NetworkImage(ipl[index].url1),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                    width: 15,
                                  ),
                                  const Text(
                                    "V / S",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(232, 255, 90, 1),
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                    width: 15,
                                  ),
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        NetworkImage(ipl[index].url2),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                ipl[index].result,
                                style: const TextStyle(
                                    color: Color.fromARGB(239, 30, 8, 235),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                ipl[index].venue,
                                style: const TextStyle(
                                    color: Color.fromARGB(173, 18, 18, 46),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Date " + ipl[index].date,
                                style: const TextStyle(
                                    color: Color.fromARGB(173, 18, 18, 46),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  getresponsesss(String url, int index) async {
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    Map dataa = data['data'];
    if (ipl[index].result == "Match not started") {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Ipl 2022"),
                content: Text("Match Has Not Started"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              ));
    } else {
      IplClass iplClass = new IplClass();
      iplClass = IplClass.fromMap(dataa);
      if (iplClass.result == "Match not started") {
        print("Match Not Started");
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(),
                settings: RouteSettings(arguments: {
                  "name": iplClass.name,
                  "result": iplClass.result,
                  "venue": iplClass.venue,
                  "date": iplClass.date,
                  "tosswiner": iplClass.tosswinner,
                  "choose": iplClass.choose,
                  "team1": iplClass.team1,
                  "team2": iplClass.team2,
                  "w1": iplClass.w1,
                  "o1": iplClass.o1,
                  "nameteam1": iplClass.nameteam1,
                  "nameteam2": iplClass.nameteam2,
                  "r1": iplClass.r1,
                  "w2": iplClass.w2,
                  "url1": iplClass.url1,
                  "url2": iplClass.url2,
                  "o2": iplClass.o2,
                  "r2": iplClass.r2,
                })));
      }
    }
  }

  void search() {}
}
