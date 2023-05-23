import 'package:flutter/material.dart';
import 'view/location_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title:'Flutter Weather',
     theme: ThemeData(
      primarySwatch: Colors.blue,
     ),
     debugShowCheckedModeBanner:false,
     home: LocationScreen()
    );
  }
}
