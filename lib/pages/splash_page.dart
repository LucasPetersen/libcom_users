import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    delayTimeAndGoHome(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'images/libcom.jpg',
              width: 320,
            ),
            Text(
              "Usuários Libcom",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  void delayTimeAndGoHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));

    navigateToHome(context);
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }
}
