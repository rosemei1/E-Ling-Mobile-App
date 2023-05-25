import 'package:flutter/material.dart';
import 'package:proto/homepage.dart';
import 'package:proto/list_pengepul.dart';
import 'package:proto/list_topik.dart';
import 'package:proto/topek.dart';

class botNav extends StatefulWidget {
  const botNav({super.key});

  @override
  State<botNav> createState() => _botNavState();
}

class _botNavState extends State<botNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    home(),
    ListTopik(),
    pengepulList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 28, 140, 36),
        onTap: _onItemTapped,
      ),
    );
  }
}