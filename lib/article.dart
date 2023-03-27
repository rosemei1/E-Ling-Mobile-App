import 'package:flutter/material.dart';
import 'dart:ui';

class Artikel extends StatelessWidget {
  const Artikel ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
          child: Text(
            'Selamat datang, Darla!',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:Colors.black38),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 16,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
          child: Text(
            'Topik',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 154, 191, 21)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Center(
                  child: Text('Card 1'),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Center(
                  child: Text('Card 2'),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Center(
                  child: Text('Card 3'),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Center(
                  child: Text('Card 4'),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 16,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
          child: Text(
            'Bacaan Terbaru',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 154, 191, 21)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
