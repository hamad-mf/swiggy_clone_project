import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Login%20Screen/login_screen.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

import '../Global_widgets/common_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundgif(),
          Positioned(
            top: 520.0,
            left: 20.0,
            child: Text(
              'Swiggy',
              style: TextStyle(
                color: ColorConstants.mainwhite, // Text color
                fontSize: 40.0, // Text size
                fontWeight: FontWeight.bold, // Text weight
              ),
            ),
          ),
          Positioned(
            top: 430,
            child: Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.LOGO_TRANSPARENT),
                      opacity: 0.6)),
            ),
          ),
          Positioned(
            top: 590.0,
            left: 20.0,
            child: Row(
              children: [
                Text(
                  "Food",
                  style:
                      TextStyle(color: ColorConstants.mainwhite, fontSize: 25),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle_rounded,
                  color: ColorConstants.primaryColor,
                  size: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Instamart",
                  style:
                      TextStyle(color: ColorConstants.mainwhite, fontSize: 25),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle_rounded,
                  color: ColorConstants.primaryColor,
                  size: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Dineout",
                  style:
                      TextStyle(color: ColorConstants.mainwhite, fontSize: 25),
                ),
              ],
            ),
          ),
          Positioned(
            top: 640.0,
            left: 20.0,
            child: Container(
              width: 350,
              height: 1,
              color: ColorConstants.mainwhite,
            ),
          ),
          Positioned(
            top: 660.0,
            left: 20.0,
            child: Text(
              "Order from top restaurants",
              style: TextStyle(color: ColorConstants.mainwhite, fontSize: 25),
            ),
          ),
          Positioned(
              top: 710,
              left: 20,
              child: CommonButton(
                buttonText: "Get Started",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ))
        ],
      ),
    );
  }

  Container _backgroundgif() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.GET_STARTED_SCREEN_BG),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
