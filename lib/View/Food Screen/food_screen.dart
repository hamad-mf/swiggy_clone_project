import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swiggy_clone_project/View/Add%20Address/add_address.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button2.dart';
import 'package:swiggy_clone_project/View/Global_widgets/fooditems_card.dart';
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
  int _selectedTabIndex = 0;

  // Define the tabs and their content
  final List<String> _tabs = ['Sort', 'Veg/Non-Veg', 'Ratings', 'Cost For Two'];
  final List<Widget> _tabContents = [
    TabContent1(),
    TabContent2(),
    TabContent3(),
    TabContent4(),
  ];

  final PageController _controller = PageController();
  final int _numPages = 3;
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                            Icon(Icons.search,
                                color: Colors.grey), // Search icon
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
                                      image: AssetImage(
                                          "assets/images/ban1.png"))),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/ban2.png"))),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/ban3.png"))),
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
                          dotHeight: 7,
                          dotWidth: 7,
                          activeDotColor: ColorConstants.mainblack,
                          dotColor: ColorConstants.maingrey),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(color: ColorConstants.buttonbg),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 227,
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => fooditems_card(),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 5),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                    color: ColorConstants.mainwhite,
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.FREE_DELIVERY_BAN))),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    common_button2(
                      onPressed: () {
                        _filterBottomSheet(context);
                      },
                      buttonText: "Filter",
                      isIconNeeded: true,
                      iconname: Icons.tune,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    common_button2(
                      onPressed: () {},
                      buttonText: "Sort by",
                      isIconNeeded: true,
                      iconname: Icons.keyboard_arrow_down_outlined,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    common_button2(
                      onPressed: () {},
                      buttonText: "Pure veg",
                      isIconNeeded: false,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    common_button2(
                      onPressed: () {},
                      buttonText: "Less than",
                      isIconNeeded: false,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _filterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return SizedBox(
                                height: 700, // Adjust height as needed
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    // Close button and title

                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Filter Page',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),

                                    Stack(children: [
                                      Row(
                                        children: [
                                          // Left side: Vertical Tabs
                                          Container(
                                            height: 620,
                                            width:
                                                180, // Fixed width for vertical tabs
                                            color: Colors.white,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: _tabs.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _selectedTabIndex =
                                                          index;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16,
                                                            left: 0),
                                                    color:
                                                        _selectedTabIndex ==
                                                                index
                                                            ? Colors.white
                                                            : Colors
                                                                .transparent,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 8,
                                                          height: 70,
                                                          color: _selectedTabIndex ==
                                                                  index
                                                              ? Colors.orange
                                                                  .shade600
                                                              : Colors
                                                                  .transparent,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          _tabs[index],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            fontSize: 16,
                                                            color: _selectedTabIndex ==
                                                                    index
                                                                ? Colors
                                                                    .orange
                                                                    .shade900
                                                                : Colors
                                                                    .black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          // Right side: Tab Content
                                          Container(
                                            height: 620,
                                            width: 212.7,
                                            padding: const EdgeInsets.all(0),
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                _tabContents[
                                                    _selectedTabIndex],
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 85,
                                          width: 392.7,
                                          color: Colors.white,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  "Clear FIlters",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: ColorConstants
                                                          .retrytxt),
                                                ),
                                                SizedBox(
                                                  width: 65,
                                                ),
                                                CommonButton(
                                                    width: 150,
                                                    height: 50,
                                                    buttonText: "Apply",
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ],
                                ),
                              );
                            },
                          );
                        },
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








//filter tab contents

class TabContent1 extends StatefulWidget {
  @override
  State<TabContent1> createState() => _TabContent1State();
}

class _TabContent1State extends State<TabContent1> {
  String? sortBy = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort By'),

          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Relevence",
                style: TextStyle(
                    color: (sortBy == "Relevence")
                        ? Colors.black
                        : Colors.grey, // Conditional text color

                    fontWeight: (sortBy == "Relevence")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "Relevence",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),

          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Delivery time",
                style: TextStyle(
                    color: (sortBy == "Delivery time")
                        ? Colors.black
                        : Colors.grey, // Conditional text color
                    fontWeight: (sortBy == "Delivery time")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "Delivery time",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),

          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Rating",
                style: TextStyle(
                    color: (sortBy == "Rating")
                        ? Colors.black
                        : Colors.grey, // Conditional text color
                    fontWeight: (sortBy == "Rating")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "Rating",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),
          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Cost Low To High",
                style: TextStyle(
                    color: (sortBy == "cost L2H")
                        ? Colors.black
                        : Colors.grey, // Conditional text color
                    fontWeight: (sortBy == "cost L2H")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "cost L2H",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),
          RadioListTile(
            activeColor: Colors.orange,
            title: Text(
              "Cost High To Low",
              style: TextStyle(
                  color: (sortBy == "Cost H2L")
                      ? Colors.black
                      : Colors.grey, // Conditional text color
                  fontWeight: (sortBy == "Cost H2L")
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
            value: "Cost H2L",
            groupValue: sortBy,
            onChanged: (value) {
              setState(() {
                sortBy = value;
              });
            },
          ),
          // More widgets here...
        ],
      ),
    );
  }
}

class TabContent2 extends StatefulWidget {
  @override
  State<TabContent2> createState() => _TabContent2State();
}

class _TabContent2State extends State<TabContent2> {
  bool? a = false;
  bool? b = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('FILTER BY'),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: a,
                  onChanged: (value) {
                    a = value;

                    setState(() {});
                  }),
              Text("Non-veg")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: b,
                  onChanged: (value) {
                    b = value;

                    setState(() {});
                  }),
              Text("Pure-veg")
            ],
          ),
        ],
      ),
    );
  }
}

class TabContent3 extends StatefulWidget {
  @override
  State<TabContent3> createState() => _TabContent3State();
}

class _TabContent3State extends State<TabContent3> {
  bool? a = false;
  bool? b = false;
  bool? c = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('FILTER BY'),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: a,
                  onChanged: (value) {
                    a = value;

                    setState(() {});
                  }),
              Text("Ratings 3.5+")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: b,
                  onChanged: (value) {
                    b = value;

                    setState(() {});
                  }),
              Text("Ratings 4.0+")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: c,
                  onChanged: (value) {
                    c = value;

                    setState(() {});
                  }),
              Text("Ratings 4.5+")
            ],
          ),
        ],
      ),
    );
  }
}

class TabContent4 extends StatefulWidget {
  @override
  State<TabContent4> createState() => _TabContent4State();
}

class _TabContent4State extends State<TabContent4> {
  bool? a = false;
  bool? b = false;
  bool? c = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('FILTER BY'),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: a,
                  onChanged: (value) {
                    a = value;

                    setState(() {});
                  }),
              Text("Less than Rs.300")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: b,
                  onChanged: (value) {
                    b = value;

                    setState(() {});
                  }),
              Text("Rs.300 - Rs.600")
            ],
          ),
        ],
      ),
    );
  }
}
