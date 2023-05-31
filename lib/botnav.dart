import 'package:flutter/material.dart';
import 'package:proto/homepage.dart';
import 'package:proto/list_topik.dart';
import 'package:proto/list_pengepul.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    required this.currentIndex,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  DateTime? _currentBackPressTime;

  void _navigateToPage(int pageIndex) {
    Widget? page;

    switch (pageIndex) {
      case 0:
        page = home();
        break;
      case 1:
        page = ListTopik();
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
            DateTime.now().difference(_currentBackPressTime!) >
                Duration(seconds: 2)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'Press back once again to exit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );

          _currentBackPressTime = DateTime.now();

          return false;
        } else {
          return true;
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
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
        padding: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavigationItem(Icons.home_outlined, 'Home', 0),
            buildNavigationItem(Icons.article_outlined, 'Articles', 1),
            buildNavigationItem(Icons.location_on_outlined, 'Locations', 2),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, String label, int index) {
    final isSelected = widget.currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _navigateToPage(index),
        child: Container(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.white54,
                size: 25,
              ),
              if (isSelected)
                SizedBox(height: 4),
              if (isSelected)
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


