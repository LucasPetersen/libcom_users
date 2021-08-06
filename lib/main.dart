import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libcom Users',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
