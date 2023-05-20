import 'package:flutter/material.dart';
import 'package:proto/homepage.dart';
import 'package:proto/topek.dart';
import 'package:proto/list_pengepul.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    required this.currentIndex,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  DateTime? _currentBackPressTime; // Track the last time back button was pressed

  void _navigateToPage(int pageIndex) {
    Widget? page;

    switch (pageIndex) {
      case 0:
        page = home();
        break;
      case 1:
        page = topikList();
        break;
      case 2:
        page = pengepulList();
        break;
    }

    if (page != null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page!,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 10),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentBackPressTime == null ||
            DateTime.now().difference(_currentBackPressTime!) > Duration(seconds: 2)) {
          // Show a snackbar with the warning message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press back once again to exit'),
              duration: Duration(seconds: 2),
            ),
          );

          // Record the current time when back button is pressed
          _currentBackPressTime = DateTime.now();

          return false;
        } else {
          return true; // Allow the app to be closed when back button is pressed again within 2 seconds
        }
      },
      child: Container(

        decoration: BoxDecoration(
          color: Color.fromARGB(255, 154, 191, 21),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal:16.0,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 5.0,
        ),
        // Bottom navigation bar content
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => _navigateToPage(0),
              icon: Icon(Icons.home_outlined, color: widget.currentIndex == 0 ? Colors.white : Colors.white54, size: 25,),
            ),
            SizedBox(width: 5,),
            IconButton(
              onPressed: () => _navigateToPage(1),
              icon: Icon(Icons.article_outlined, color: widget.currentIndex == 1 ? Colors.white : Colors.white54, size: 25),
            ),
            SizedBox(width: 5,),
            IconButton(
              onPressed: () => _navigateToPage(2),
              icon: Icon(Icons.location_on_outlined, color: widget.currentIndex == 2 ? Colors.white : Colors.white54, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
