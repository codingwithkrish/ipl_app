import 'package:flutter/material.dart';
import 'package:ipl_app/screens/new.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isprogress = true;
  @override
  void initState() {
    autonavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 250,
              child: Lottie.asset(
                "images/krish.json",
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
            ),
            Expanded(
              child: Text(
                'Ipl Score Board',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 81, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            if (_isprogress)
              CircularProgressIndicator(
                backgroundColor: Colors.grey,
                strokeWidth: 5,
                color: Colors.purple,
              ),
            SizedBox(
              height: 100,
            ),
            Text("Indian Premium League 2022")
          ],
        ),
      )),
    );
  }

  autonavigate() {
    Future.delayed(Duration(seconds: 5), () {
      _isprogress = false;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => New()));
    });
  }
}
