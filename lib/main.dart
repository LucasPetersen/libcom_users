import 'package:flutter/material.dart';

import 'model/usuario.dart';
import 'pages/add_edit_usuario_page.dart';
import 'pages/detail_page.dart';
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
          "/detail": (context) => DetailPage(
                usuario: ModalRoute.of(context)!.settings.arguments as Usuario,
              ),
          "/add_edit_usuario": (context) => AddEditUsuarioPage(
                usuario: ModalRoute.of(context)!.settings.arguments != null
                    ? ModalRoute.of(context)!.settings.arguments as Usuario
                    : null,
              ),
        });
  }
}
