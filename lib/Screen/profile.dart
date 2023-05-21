import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/Spidesona_1.jpg'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ichvan Rachmawan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6.0),
            Text('123200147',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 6.0),
            Text('IF-H',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 8.0),
            Text(
              'I want to be Spider-Man and meet Billie Eilish',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(color: Colors.white, Icons.cake),
              title: Text('Jakarta, 19 July 2002', style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(color: Colors.white, Icons.book),
              title: Text('TPM WAS FUN, ITS VERY CHALLENGING FOR ME. I HOPE SOMEDAY I CAN BECAME A MOBILE DEVELOPER.', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}