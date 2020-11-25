import 'package:flutter/material.dart';
import 'package:monday/views/shopping_page.dart';
import 'package:monday/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:monday/views/text.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final navController = Get.put(NavController());
  final tabs = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('This'),
    ),
    ShoppingPage(),
  ];
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Texttt();
      case 1:
        return Center(
          child: Text('This'),
        );
      case 2:
        return ShoppingPage();
        break;
      default:
        return Center(
          child: Text('Home'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = navController.currentIndex.value;
    return Scaffold(
        appBar: AppBar(),
        extendBodyBehindAppBar: true,
        body: callPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airline_seat_flat),
              title: Text("Another"),
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              title: Text("This"),
              backgroundColor: Colors.blue,
            ),
          ],
          onTap: (index) {
            navController.changeIndex(index);
            _currentIndex = navController.currentIndex.value;
            setState(() {});
          },
        ));
  }
}
