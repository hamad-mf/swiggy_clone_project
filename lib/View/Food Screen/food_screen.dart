import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swiggy_clone_project/View/Add%20Address/add_address.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class FoodScreen extends StatefulWidget {
  String adname;
  IconData? selectedIcon;
  String addistrict;
  String adlocality;
  String adlandmark;
  FoodScreen(
      {required this.adname,
      required this.selectedIcon,
      required this.addistrict,
      required this.adlandmark,
      required this.adlocality,
      super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final PageController _controller = PageController();
  final int _numPages = 2;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      int nextPage = _controller.page!.round() + 1; //next page to
      if (nextPage >= _numPages) {
        //if its last slide go back to first
        _controller.animateToPage(0,
            duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      } else {
        //move to next page
        _controller.animateToPage(nextPage,
            duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      }
    });
  }




  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8)),
            _headerSection(context),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConstants
                          .searchfieldbg, // Background color for the TextFormField
                      hintText: "Search for dishes & restaurants",
                      hintStyle:
                          TextStyle(color: Colors.grey), // Hint text styling
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20), // Padding inside TextFormField
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
                        mainAxisSize: MainAxisSize
                            .min, // To make the row fit only the icons
                        mainAxisAlignment: MainAxisAlignment
                            .end, // Aligns the icons at the end
                        children: [
                          Icon(Icons.search, color: Colors.grey), // Search icon
                          SizedBox(width: 8), // Space between the two icons
                          Icon(Icons.mic,
                              color: Colors.orange), // Microphone icon
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: PageView(
                        controller: _controller,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/ban1.png"))),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/ban2.png"))),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: _numPages,
                    effect: WormEffect(
                        dotHeight: 5,
                        dotWidth: 5,
                        activeDotColor: ColorConstants.mainblack,
                        dotColor: ColorConstants.maingrey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _headerSection(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAddress(
                                        isSelected: true,
                                        selectedIcon: widget.selectedIcon,
                                        visible: true,
                                        adname: widget.adname,
                                        addistrict: widget.addistrict,
                                        adlandmark: widget.adlandmark,
                                        adlocality: widget.adlocality,
                                      )));
                        },
                        child: Row(
                          children: [
                            Icon(
                              widget.selectedIcon,
                              color: ColorConstants.primaryColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.adname,
                                  style: TextStyle(
                                      color: ColorConstants.mainblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.addistrict,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: ColorConstants.retrytxt),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.adlocality,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(color: ColorConstants.retrytxt)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.adlandmark,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(color: ColorConstants.retrytxt)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 80,
              top: 10,
              child: Container(
                width: 75,
                height: 38,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ImageConstants.ONE_LOGO)),
                    color: Colors.white,
                    border: Border.all(
                        width: 1, color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Positioned(
                right: 103,
                child: Container(
                  decoration: BoxDecoration(color: ColorConstants.mainwhite),
                  child: Text(
                    "BUY",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.maingrey),
                  ),
                )),
            Positioned(
                right: 20,
                top: 8,
                child: CircleAvatar(
                  backgroundColor: ColorConstants.profilebg,
                  child: Icon(
                    Icons.person,
                    color: ColorConstants.mainwhite,
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
