import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Card%20Screen/card_screen.dart';
import 'package:swiggy_clone_project/View/Food%20Screen/food_screen.dart';
import 'package:swiggy_clone_project/View/Reorder%20Screen/reorder_screen.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class BottomNavbarScreen extends StatefulWidget {
  final String adname;
  final IconData? selectedIcon;
  final String addistrict;
  final String adlocality;
  final String adlandmark;

  BottomNavbarScreen({
    required this.adname,
    required this.selectedIcon,
    required this.addistrict,
    required this.adlandmark,
    required this.adlocality,
    super.key,
  });

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  late List<Widget> screens; // Declare the screens list as a late variable
  int selectedindex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the screens list inside initState
    screens = [
      FoodScreen(
        adname: widget.adname,
        addistrict: widget.addistrict,
        adlandmark: widget.adlandmark,
        adlocality: widget.adlocality,
        selectedIcon: widget.selectedIcon,
      ),
      CardScreen(),
      ReorderScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        currentIndex: selectedindex,
        backgroundColor: ColorConstants.mainwhite,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: ColorConstants.maingrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.rice_bowl_outlined),
            activeIcon: Icon(Icons.rice_bowl),
            label: "Food",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            activeIcon: Icon(Icons.credit_card),
            label: "Card",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_outlined),
            activeIcon: Icon(Icons.shopping_cart_checkout),
            label: "Reorder",
          ),
        ],
      ),
      body: screens[selectedindex],
    );
  }
}
