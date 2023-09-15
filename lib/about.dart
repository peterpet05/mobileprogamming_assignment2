import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('A B O U T'),
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
      body: Container(
        padding: EdgeInsets.only(top: 85.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/Person.jpg'), radius: 122/2,
            ),
            SizedBox(height: 20),
            Text('Peter', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 35),
                Icon(Icons.person),
                SizedBox(width: 15),
                Text('825210022', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                SizedBox(width: 35),
                Icon(Icons.mail),
                SizedBox(width: 15),
                Text('peter.825210022@stu.untar.ac.id', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                SizedBox(width: 35),
                Icon(Icons.school),
                SizedBox(width: 15),
                Text('Sistem Informasi UNTAR 2021', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 90),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
            Image.asset('assets/LogoFTI.png',
              width: 130,
              height: 55,
              fit: BoxFit.cover,
            ),
            Image.asset('assets/LogoSI.png',
              width: 150,
              height: 55,
              fit: BoxFit.cover,
            ),
              ],
           ),
          ],
        ),
      ),
    );
  }
}