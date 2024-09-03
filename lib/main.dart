import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Get%20Started%20Screen/get_started_screen.dart';
import 'package:swiggy_clone_project/View/Login%20Screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
    );
  }
}
