import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Location%20Screen/location_screen.dart';
import 'package:swiggy_clone_project/View/Splash%20Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationScreen(),
    );
  }
}



