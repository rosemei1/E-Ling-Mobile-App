import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proto/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png', // change this to your image path
              width: 150, // set the width and height of the imag
            ),
            SizedBox(height: 10,),
            RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Platform ",
                      style: TextStyle(
                          fontFamily: "WorkSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 28, 140, 36)
                      ),
                    ),
                    TextSpan(
                      text: "Edukasi ",
                      style: TextStyle(
                          fontFamily: "WorkSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 154, 191, 21)
                      ),
                    ),
                    TextSpan(
                      text: "Lingkungan",
                      style: TextStyle(
                          fontFamily: "WorkSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 28, 140, 36)
                      ),
                    ),
                  ]
                )
            ),
            SizedBox(height: 10,),
            Image.asset(
              'assets/images/aer.png', // change this to your image path
              width: 250, // set the width and height of the imag
            ),
          ],
        ),
      ),
    );
  }
}
