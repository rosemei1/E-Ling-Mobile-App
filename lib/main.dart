import 'package:flutter/material.dart';
import 'package:proto/artlist.dart';
import 'package:proto/bottombar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'eling';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      // home: MyStatefulWidget(),
      home: artListPage(),
    );
  }
}
