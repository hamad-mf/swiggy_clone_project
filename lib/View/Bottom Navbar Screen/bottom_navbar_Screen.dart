import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Card%20Screen/card_screen.dart';
import 'package:swiggy_clone_project/View/Food%20Screen/food_screen.dart';
import 'package:swiggy_clone_project/View/Reorder%20Screen/reorder_screen.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  List screens = [
    FoodScreen(),
    CardScreen(),
    ReorderScreen(),
  ];

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedindex = value;
            setState(() {});
          },
          currentIndex: selectedindex,
          backgroundColor: ColorConstants.mainwhite,
          selectedItemColor: ColorConstants.primaryColor,
          unselectedItemColor: ColorConstants.maingrey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.rice_bowl_outlined),
                activeIcon: Icon(Icons.rice_bowl),
                label: "Food"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_outlined),
                activeIcon: Icon(Icons.credit_card),
                label: "Card"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined),
                activeIcon: Icon(Icons.shopping_cart_checkout),
                label: "Reorder"),
          ]),
      body: screens[selectedindex],
    );
  }
}
