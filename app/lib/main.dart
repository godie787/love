import 'package:flutter/material.dart';
import 'screens/intro/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Couple App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: IntroScreen(),
    );
  }
}
