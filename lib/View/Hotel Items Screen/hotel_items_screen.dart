import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button2.dart';
import 'package:swiggy_clone_project/View/Hotel%20Items%20Screen/Widgets/items.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class HotelItemsScreen extends StatefulWidget {
  const HotelItemsScreen({super.key});

  @override
  State<HotelItemsScreen> createState() => _HotelItemsScreenState();
}

class _HotelItemsScreenState extends State<HotelItemsScreen> {
  bool onoroff = true;
  bool _isExpanded = false;
  final _controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.lightblue,
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: ColorConstants.mainblack,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 7),
                    Icon(Icons.person_add_alt_1_outlined, size: 22),
                    SizedBox(width: 3),
                    Text(
                      "GROUP ORDER",
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.mainblack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: ColorConstants.lightblue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Team up and order.\nAdd dishes together to",
                      style: TextStyle(
                        color: ColorConstants.mainblack,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "a ",
                          style: TextStyle(
                            color: ColorConstants.mainblack,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Shared cart!",
                          style: TextStyle(
                            color: ColorConstants.bluetext,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: ColorConstants.mainwhite,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 25,
                            left: 20,
                            child: Icon(
                              Icons.favorite,
                              size: 15,
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                          Positioned(
                            top: 23,
                            left: 40,
                            child: Text(
                              "Best in Ice Cream",
                              style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 20,
                            child: Container(
                              height: 30,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstants.ratingbox,
                              ),
                              child: Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Icon(
                                    Icons.star,
                                    color: ColorConstants.mainwhite,
                                    size: 18,
                                  ),
                                  Text(
                                    " 4.1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstants.mainwhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 21,
                            child: Text(
                              "50 ratings",
                              style: TextStyle(
                                fontSize: 11,
                                color: ColorConstants.retrytxt,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 55,
                            left: 20,
                            child: Text(
                              "Amul Ice Cream Parlour",
                              style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 85,
                            left: 20,
                            child: Text(
                              "50-55 min",
                              style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 95,
                            left: 98,
                            child: CircleAvatar(
                              radius: 2.1,
                              backgroundColor: ColorConstants.mainblack,
                            ),
                          ),
                          Positioned(
                            top: 85,
                            left: 110,
                            child: Text(
                              "9 km",
                              style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 95,
                            left: 150,
                            child: CircleAvatar(
                              radius: 2.1,
                              backgroundColor: ColorConstants.mainblack,
                            ),
                          ),
                          Positioned(
                            top: 85,
                            left: 160,
                            child: Text(
                              "Kodungallur",
                              style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 85,
                            left: 240,
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                          Positioned(
                            top: 115,
                            left: 20,
                            child: Text(
                              "Ice Cream , Beverages",
                              style: TextStyle(
                                color: ColorConstants.retrytxt,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.mainblack),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 60,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: PageView(
                    children: [
                      Container(
                        color: ColorConstants.mainwhite,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              ImageConstants.DISCOUNT,
                              scale: 14,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "60% off upto ₹120",
                                  style: TextStyle(
                                      color: ColorConstants.mainblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "USE BFBING | ABOVE ₹149",
                                  style: TextStyle(
                                      color: ColorConstants.retrytxt,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "1/3",
                                  style: TextStyle(
                                      color: ColorConstants.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor:
                                          ColorConstants.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: ColorConstants.profilebg
                                          .withOpacity(0.4),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: ColorConstants.profilebg
                                          .withOpacity(0.4),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: ColorConstants.mainwhite,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              ImageConstants.WELCOME,
                              scale: 4,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Flat ₹100 off",
                                  style: TextStyle(
                                      color: ColorConstants.mainblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "USE WELCOMEBACK100 | ABOVE ₹199",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ColorConstants.retrytxt,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "2/3",
                                  style: TextStyle(
                                      color: ColorConstants.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: ColorConstants.profilebg
                                          .withOpacity(0.4),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor:
                                          ColorConstants.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: ColorConstants.profilebg
                                          .withOpacity(0.4),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: ColorConstants.mainwhite,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              ImageConstants.DISCOUNT,
                              scale: 14,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "10% off upto ₹40",
                                  style: TextStyle(
                                      color: ColorConstants.mainblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "USE TRYNEW | ABOVE ₹179",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ColorConstants.retrytxt,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "3/3",
                                  style: TextStyle(
                                      color: ColorConstants.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: ColorConstants.profilebg
                                          .withOpacity(0.4),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: ColorConstants.profilebg
                                          .withOpacity(0.4),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor:
                                          ColorConstants.primaryColor,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(child: Text("MENU")),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstants.searchfieldbg,
                  hintText: "Search for dishes & restaurants",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Icon(Icons.mic, color: Colors.orange),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  common_button2(
                    onPressed: () {},
                    buttonText: "Rating 4.0+",
                    isIconNeeded: false,
                  ),
                  SizedBox(width: 10),
                  common_button2(
                    onPressed: () {},
                    buttonText: "Bestseller",
                    isIconNeeded: false,
                  ),
                  SizedBox(width: 10),
                  common_button2(
                    onPressed: () {},
                    buttonText: "daata",
                    isIconNeeded: false,
                  ),
                  SizedBox(width: 10),
                  common_button2(
                    onPressed: () {},
                    buttonText: "daata",
                    isIconNeeded: false,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          SliverToBoxAdapter(
            child: ListTile(
              title: InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  "Recommended (4)",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
          ),

          // Expandable grid
          if (_isExpanded)
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Number of columns
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2, // Aspect ratio for the grid items
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return items();
                  },
                  childCount: 4, // Number of items in the grid
                ),
              ),
            ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          )
        ],
      ),
    );
  }
}
