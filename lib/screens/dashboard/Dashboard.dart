import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled/screens/signin/SignIn.dart';

import 'HomeScreen.dart';
import 'OrderScreen.dart';
import 'ProfileScreen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }


  static const List<String> _screenTitles = [
    'Home',
    'Order',
    'Profile',
  ];

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? '';
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(context, '/signin/SignIn', (route) => false);
  }
  // void _logout() async {
  //   // Remove stored user data
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  //
  //   // Navigate to the sign-in page
  //   Navigator.pushReplacementNamed(context, '/signin/SignIn');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitles[_selectedIndex]),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}





