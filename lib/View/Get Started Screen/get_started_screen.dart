import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg video final.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                      image: AssetImage('assets/images/og logo.png'),
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
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Get Started"),
                style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(350, 60)),
                    backgroundColor:
                        WidgetStatePropertyAll(ColorConstants.primaryColor),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    foregroundColor:
                        WidgetStatePropertyAll(ColorConstants.mainwhite),
                    textStyle: WidgetStatePropertyAll(
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
              ))
        ],
      ),
    );
  }
}
