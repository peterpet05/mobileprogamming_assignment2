import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();

}

class _CountdownTimerState extends State<CountdownTimer> {
  @override
  int hour = 0;
  int minute = 0;
  int second = 0;
  bool started = true;
  bool stopped = true;
  int timerTime = 0;
  String displayTime = "00:00:00";
  bool checktimer = true;

  final ButtonStyle raisedButtonStyle1 = ElevatedButton.styleFrom(
    backgroundColor: Colors.green[700],
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );

  final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
    backgroundColor: Colors.red[700],
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );

  void start(){
    setState(() {
      started = false;
      stopped = false;
    });
    timerTime = ((hour * 60 * 60) + (minute * 60) + second);
    Timer.periodic(Duration(
      seconds: 1,
    ), (Timer t){
      setState(() {
        if(timerTime < 1 ){
          t.cancel();
          checktimer = true;
          displayTime = "00:00:00";
          started = true;
          stopped = true;
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  TextButton
                    (onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('BACK', style: TextStyle(color: Colors.deepPurple),))
                ],
                title: const Text('TIME IS UP', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700)),
                titlePadding: EdgeInsets.fromLTRB(63.0, 40.0, 0, 0.0),
                contentPadding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                content: const Icon(Icons.timer_off_sharp, size: 65.0, color: Colors.black),
              ));
        }
        else if (checktimer == false) {
          t.cancel();
          checktimer = true;
          displayTime = "00:00:00";
          started = true;
          stopped = true;
        }
        else if (timerTime < 60) {
          if (timerTime < 10) {
            displayTime = "00:00:0" + timerTime.toString();
          }
          else {
            displayTime = "00:00:" + timerTime.toString();
          }
          timerTime = timerTime - 1;
        }
        else if (timerTime < 3600) {
          int min = timerTime ~/ 60;
          int sec = timerTime - (60 * min);
          if (min < 10 && sec < 10) {
            displayTime = "00:0" + min.toString() + ":0" + sec.toString();
          }
          else if (min < 10) {
            displayTime = "00:0" + min.toString() + ":" + sec.toString();
          }
          else if (sec < 10) {
            displayTime = "00:" + min.toString() + ":0" + sec.toString();
          }
          else {
            displayTime = "00:" + min.toString() + ":" + sec.toString();
          }
          timerTime = timerTime - 1;
        }
        else {
          int h = timerTime ~/ 3600;
          int t = timerTime - (3600 * h);
          int min = t ~/ 60;
          int sec = t - (60 * min);
          if (h < 10 && min < 10 && sec < 10) {
            displayTime = "0" + h.toString() + ":0" + min.toString() + ":0" + sec.toString();
          }
          else if (h < 10 && min < 10) {
            displayTime = "0" + h.toString() + ":0" + min.toString() + ":" + sec.toString();
          }
          else if (h < 10 && sec < 10) {
            displayTime = "0" + h.toString() + ":" + min.toString() + ":0" + sec.toString();
          }
          else if (min < 10 && sec < 10) {
            displayTime = h.toString() + ":0" + min.toString() + ":0" + sec.toString();
          }
          else if (h < 10) {
            displayTime = "0" + h.toString() + ":" + min.toString() + ":" + sec.toString();
          }
          else if (min < 10) {
            displayTime = h.toString() + ":0" + min.toString() + ":" + sec.toString();
          }
          else if (sec < 10) {
            displayTime = h.toString() + ":" + min.toString() + ":0" + sec.toString();
          }
          else {
            displayTime =
            h.toString() + ":" + min.toString() + ":" + sec.toString();
          }
          timerTime = timerTime - 1;
        }
      });
    });
  }

  void stop(){
    setState(() {
      started = true;
      stopped = true;
      checktimer = false;
    });
  }

  Widget timer(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 10.0
                    ),
                    child: Text(
                        "HOUR",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                    ),
                  ),
                  NumberPicker(
                      minValue: 0,
                      maxValue: 23,
                      value: hour,
                      onChanged: (val){
                        setState(() {
                          hour = val;
                        });
                      },
                  ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0
                      ),
                      child: Text(
                          "MINUTE",
                          style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: minute,
                      onChanged: (val){
                        setState(() {
                          minute = val;
                        });
                      },
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0
                      ),
                      child: Text(
                          "SECOND",
                          style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: second,
                      onChanged: (val){
                        setState(() {
                          second = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20)
              ),
              child:
              Text(
                displayTime,
                style: TextStyle(
                    fontSize: 47.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    style: raisedButtonStyle1,
                    onPressed: started ? start : null,
                    label: const Text('Start',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    icon: const Icon(Icons.play_arrow),
                  ),
                  ElevatedButton.icon(
                    style: raisedButtonStyle2,
                    onPressed: stopped ? null : stop,
                    label: const Text('Reset',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    icon: const Icon(Icons.restart_alt_outlined),
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T I M E R'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(onPressed: () {},
            icon: Icon(Icons.menu)),
        actions: [
              IconButton(onPressed: () {},
              icon: Icon(Icons.share)),
        ],
      ),
    body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(child: timer()),
      ],
      ),
    );
  }
}
