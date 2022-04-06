import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/services/mongodb_server.dart';

import 'package:admin/screens/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {

  // Init DataBase
  MongoDbServer.connect();

  runApp(MyApp());

  print('app closed');
}

class MyApp extends StatefulWidget
{

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>
{

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: LoginScreen()
    );
  }
}
