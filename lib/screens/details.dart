import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ipl_app/Model/model2.dart';
import 'package:ipl_app/Widget/widget.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String? name;
  late Map info;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 219, 219),
      appBar: AppBar(
        title: Text("Indian Premier League 2022"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 81, 255),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              elevation: 15,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Text(
                        info["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            info["venue"],
                            style: TextStyle(
                                color: Color.fromARGB(157, 0, 0, 0),
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            info["date"],
                            style: TextStyle(
                                color: Color.fromARGB(157, 0, 0, 0),
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        info["nameteam1"] + " and " + info["nameteam2"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(232, 255, 90, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                              tag: 'krish1',
                              child: GestureDetector(
                                onTap: () {
                                  _showsecondimage(info["url1"], "krish1");
                                },
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(info["url1"]),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                            width: 15,
                          ),
                          Text(
                            "V / S",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(232, 255, 90, 1),
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                            width: 15,
                          ),
                          Hero(
                              tag: 'krish2',
                              child: GestureDetector(
                                onTap: () {
                                  _showsecondimage(info["url2"], "krish2");
                                },
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(info["url2"]),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Toss Won by  ${info["tosswiner"]} and Choose to  ${info["choose"]} first ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 0, 81, 255)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Runs(
                        name: info["team1"],
                        wicket: info["w1"],
                        over: info["o1"],
                        runs: info["r1"],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Runs(
                          name: info["team2"],
                          runs: info["r2"],
                          wicket: info["w2"],
                          over: info["o2"]),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        info["result"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(239, 30, 8, 235),
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void _showsecondimage(String url, String tag) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(
                child: Hero(tag: tag, child: Image.network(url)),
              ),
            )));
  }
}
