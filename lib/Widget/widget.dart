import 'package:flutter/material.dart';

class Runs extends StatelessWidget {
  final String name;
  final int runs;
  final int wicket;
  final double over;
  const Runs(
      {Key? key,
      required this.name,
      required this.runs,
      required this.wicket,
      required this.over})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(232, 255, 90, 1),
        elevation: 10,
        shadowColor: Colors.black12,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              Text(
                "${name}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Total Runs :- ${runs}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Wickets lost  :- ${wicket}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Overs :- ${over}",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
