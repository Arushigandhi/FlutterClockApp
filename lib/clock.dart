import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  double minutesAngle = 0;
  double secondsAngle = 0;
  double hoursAngle = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final now = DateTime.now();
      //print(now);
      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minutesAngle = pi / 30 * now.minute;
        hoursAngle = (pi / 6 * now.hour) + (pi / 45 * minutesAngle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(Theme.of(context).colorScheme.primary);
    return Container(
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.asset('assets/clock.png'),
            Container(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.03,
                //height: 15,
                //width: 15,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
              ),
              alignment: Alignment(0, 0),
            ),
            Transform.rotate(
              child: Container(
                //Hours
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.015,
                  //height: 70,
                  //width: 7,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)),
                ),
                alignment: Alignment(0, -0.35),
              ),
              angle: hoursAngle,
            ),
            Transform.rotate(
              child: Container(
                //seconds
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 0.005,
                  //height: 140,
                  //width: 2,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                ),
                alignment: Alignment(0, -0.35),
              ),
              angle: secondsAngle,
            ),
            Transform.rotate(
              child: Container(
                //Minutes
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.01,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                ),
                alignment: Alignment(0, -0.35),
              ),
              angle: minutesAngle,
            ),
          ],
        ),
        width: 370,
        height: 370,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.pinkAccent, width: 5),
            borderRadius: BorderRadius.circular(200)),
        alignment: Alignment.center,
      ),
      color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
    );
  }
}
