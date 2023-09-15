import 'package:flutter/material.dart';
import 'package:mobileprograaming_stopwatch/login_screen.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  Widget build (BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}