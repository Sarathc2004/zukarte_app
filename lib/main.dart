import 'package:flutter/material.dart';
import 'package:zukarte_app/Screens/Category/categoryscreen.dart';
import 'package:zukarte_app/Screens/Login/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
