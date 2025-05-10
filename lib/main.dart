import 'package:flutter/material.dart';
import 'cancel_page.dart';
import 'user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room Booking App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MyNavigation(),
    );
  }
}

class MyNavigation extends StatefulWidget {
  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    Center(child: Text("Home Page", style: TextStyle(fontSize: 20))),
    Center(child: Text("Notifications", style: TextStyle(fontSize: 20))),
    CancelPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/home.png', width: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/notification.png', width: 24),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/room detail.png', width: 24),
            label: 'Room Details',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/user.png', width: 24),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
