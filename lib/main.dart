import 'package:flutter/material.dart';
import 'package:fp_themeal/Screen/dashboard.dart';
import 'package:fp_themeal/Screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userId = prefs.getString('userId');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Final Project',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: userId == null ? LoginPage() : Dashboard(),
  ));
}

