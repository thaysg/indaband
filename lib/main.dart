import 'package:flutter/material.dart';
import 'package:indaband/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndaBand',
      theme: ThemeData.dark().copyWith(),
      home: HomeScreen(),
    );
  }
}
