import 'package:flutter/material.dart';

import 'package:swiggy_clone_project/View/Add%20New%20Address/add_new_adress.dart';
import 'package:swiggy_clone_project/View/Allow%20Notification/allow_notification.dart';


import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class AddAddress extends StatefulWidget {
  IconData? selectedIcon;
  String adname = "Home";
  String addistrict = "Thrissur";
  String adlocality = "azhicode";
  String adlandmark = "raja auditorium";
  bool visible = false;
  bool isSelected = false;
  AddAddress(
      {required this.adname,
      required this.selectedIcon,
      required this.visible,
      required this.isSelected,
      required this.addistrict,
      required this.adlandmark,
      required this.adlocality,
      super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    bool IsVisibleTrue = widget.visible;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        titleSpacing: 0,
        title: Text(
          "Enter your adress details ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 50,
                width: 360,
                decoration: BoxDecoration(
                    color: ColorConstants.mainwhite,
                    border:
                        Border.all(width: 1, color: ColorConstants.retrytxt),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    Icon(
                      Icons.search_outlined,
                      color: ColorConstants.retrytxt,
                      size: 27,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Try JP Nagar, Siri Gardenia,etc",
                      style: TextStyle(color: ColorConstants.retrytxt),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                Icon(
                  Icons.near_me,
                  color: ColorConstants.primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Use my current location",
                  style: TextStyle(
                      color: ColorConstants.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 135,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstants.retrytxt,
                  size: 15,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                Icon(
                  Icons.add,
                  color: ColorConstants.primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNewAdress()));
                  },
                  child: Text(
                    "Add new adress",
                    style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 120,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "SAVED ADDRESSES",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: ColorConstants.retrytxt),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (IsVisibleTrue)
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllowNotification(
                                passadname: widget.adname,
                                passaddistrict: widget.addistrict,
                                passadlandmark: widget.adlandmark,
                                passadlocality: widget.adlocality,
                                passselectedicon: widget.selectedIcon,
                              )));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(widget.selectedIcon),
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
                                  SizedBox(
                                    width: 12,
                                  ),
                                  if (widget.isSelected)
                                    Container(
                                      width: 150,
                                      height: 20,
                                      color: Colors.green.withOpacity(0.2),
                                      child: Text(
                                        "CURRENTLY SELECTED",
                                      ),
                                    )
                                ],
                              ),
                            ],
                          ),
                          PopupMenuButton(
                              iconSize: 24,
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text("Delete"),
                                      onTap: () {
                                        Future.delayed(
                                            Duration.zero,
                                            () => setState(() {
                                                  widget.visible = false;
                                                }));
                                      },
                                    )
                                  ])
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
                                  style:
                                      TextStyle(color: ColorConstants.retrytxt),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(widget.adlocality,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: ColorConstants.retrytxt)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(widget.adlandmark,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: ColorConstants.retrytxt)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
