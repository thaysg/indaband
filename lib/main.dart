import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indaband/home_screen/home_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then((_) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    WidgetsFlutterBinding.ensureInitialized();
  });
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
