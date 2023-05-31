import 'package:flutter/material.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'eling';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 250, 244)),
      debugShowCheckedModeBanner: false,
      title: _title,
      home: SplashScreen(),
    );
  }
}
