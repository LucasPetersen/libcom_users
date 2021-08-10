import 'package:flutter/material.dart';

import 'model/pessoa.dart';
import 'pages/add_edit_pessoa_page.dart';
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
                pessoa: ModalRoute.of(context)!.settings.arguments as Pessoa,
              ),
          "/add_edit_pessoa": (context) => AddEditPessoaPage(
                pessoa: ModalRoute.of(context)!.settings.arguments != null
                    ? ModalRoute.of(context)!.settings.arguments as Pessoa
                    : null,
              ),
        });
  }
}
