import 'package:flutter/material.dart';
import 'dart:ui';

class Artikel extends StatelessWidget {
  const Artikel ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 0,
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
