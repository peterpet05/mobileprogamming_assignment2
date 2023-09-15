import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobileprograaming_stopwatch/about.dart';
import 'package:mobileprograaming_stopwatch/countdown_timer.dart';
import 'package:mobileprograaming_stopwatch/stopwatch.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _index = 1;
  final screens = [
    CountdownTimer(),
    Stopwatch(name: 'name', email: 'email@gmail.com'),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[_index],
      bottomNavigationBar: Container(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20.0
          ),
          child: GNav(

              backgroundColor: Colors.deepPurple,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.white.withOpacity(0.25),

              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.access_alarm,
                  text: 'Timer',
                ),
                GButton(
                  icon: Icons.timer_outlined,
                  text: 'Stopwatch',
                ),
                GButton(
                  icon: Icons.info_outline,
                  text: 'About',
                )
              ],
              selectedIndex: _index,
              onTabChange: (index){
                setState(() {
                  _index = index;
                });
              },
          ),
        ),
      ),
    );
  }
}
