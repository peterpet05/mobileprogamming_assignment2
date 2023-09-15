import 'dart:async';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  final String name;
  final String email;

  const Stopwatch({Key? key, required this.name, required this.email})
      : super(key:key);

  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<Stopwatch> {
  late bool isTicking = true;
  int seconds = 0;
  late Timer timer;
  int milliseconds = 0;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  final ButtonStyle raisedButtonStyle1 = ElevatedButton.styleFrom(
    backgroundColor: Colors.green[700],
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );

  final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
    backgroundColor: Colors.red[700],
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );

  final ButtonStyle raisedButtonStyle3 = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[700],
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );
  // void initState() {
  //   super.initState();
  //   isTicking = true;
  //   seconds = 0;
  //   timer = Timer.periodic(Duration(seconds: 1), _onTick);
  // }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  // String _secondsString() => seconds == 1 ? 'second' : 'seconds';
  String _secondsString(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds SECONDS';
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _resetTimer() {
    // timer.cancel();
    setState(() {
      milliseconds = 0;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      _resetTimer();
    });

    scrollController.animateTo(
        itemHeight * laps.length,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn);
  }

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S T O P W A T C H'),
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
              child: _buildCounter(context)),
          Expanded(
            flex: 6,
              child: _buildLapDisplay())
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              'Lap ${laps.length + 1}',
                style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600)
            ),
            SizedBox(height: 10),
            Text(
                _secondsString(milliseconds),
                style: TextStyle(color: Colors.black, fontSize: 42.0, fontWeight: FontWeight.w600)
            ),
            SizedBox(height: 25),
            buildControls(),
          ]
      ),
    );
  }

  Widget buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        ElevatedButton.icon(
          style: raisedButtonStyle1,
          onPressed: () => _startTimer(),
          label: const Text('Start',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          icon: const Icon(Icons.play_arrow),
        ),

        SizedBox(width: 20),
        ElevatedButton.icon(
          style: raisedButtonStyle2,
          onPressed: () => _stopTimer(),
          label: const Text('Stop',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          icon: const Icon(Icons.stop),
        ),

        SizedBox(width: 20),
        ElevatedButton.icon(
          style: raisedButtonStyle3,
          onPressed: isTicking ? _lap : null,
          label: const Text('Lap',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          icon: const Icon(Icons.flag),
        ),
      ],
    );
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
          controller: scrollController,
          itemExtent: itemHeight,
          itemCount: laps.length,
          itemBuilder: (context, index) {
            final milliseconds = laps[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              title: Text('Lap ${index + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17
              )),
              trailing: Text(_secondsString(milliseconds),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17
              )
              ),
            );
          }
      ),
    );
  }
}