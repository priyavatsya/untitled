import 'package:flutter/material.dart';
import 'package:untitled/screens/dashboard/Dashboard.dart';
import 'package:untitled/screens/signin/SignIn.dart';
import 'package:untitled/screens/signup/SignUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/signin/SignIn': (context) => SignInScreen(),
      },
    );
  }
}