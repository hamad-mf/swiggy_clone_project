import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiggy_clone_project/View/Add%20Address/add_address.dart';
import 'package:swiggy_clone_project/View/Allow%20Notification/allow_notification.dart';
import 'package:swiggy_clone_project/View/Bottom%20Navbar%20Screen/bottom_navbar_Screen.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';

import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 45, right: 15),
              child: Text(
                "What's your location?",
                style: TextStyle(
                    color: ColorConstants.mainblack,
                    fontSize: 32,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8, right: 15),
              child: Text(
                  "We need your location to show available\nrestaurants & products",
                  style:
                      TextStyle(fontSize: 19, color: ColorConstants.retrytxt)),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(ImageConstants.LOCATION_SCRN_BG))),
                  ),
                  Positioned(
                    bottom: 140,
                    right: 20,
                    left: 20,
                    child: CommonButton(
                        buttonText: "Allow location access",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: ColorConstants.mainblack,
                                    content: Text(
                                      "Allow Swiggy to access this device's location?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstants.mainwhite),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AllowNotification(
                                                        passadname: "Home",
                                                        passaddistrict:
                                                            "Thrissur",
                                                        passadlandmark:
                                                            "auditorium",
                                                        passadlocality:
                                                            "azhicode",
                                                        passselectedicon:
                                                            Icons.home,
                                                      )));
                                        },
                                        child: Text("Yes"),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("No"))
                                    ],
                                  ));
                        }),
                  ),
                  Positioned(
                    bottom: 95,
                    right: 0,
                    left: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAddress(
                                      isSelected: false,
                                      selectedIcon: Icons.ac_unit,
                                      visible: false,
                                      adname: "",
                                      addistrict: "",
                                      adlandmark: "",
                                      adlocality: "",
                                    )));
                      },
                      child: Text(
                        "Enter Location Manually",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.buttontxt),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
