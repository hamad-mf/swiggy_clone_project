import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/temp/temp.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        titleSpacing: 0,
        title: Text(
          "Enter your adress details",
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
                Text(
                  "Add new adress",
                  style: TextStyle(
                      color: ColorConstants.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Temp()));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.home_filled),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: ColorConstants.mainblack,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 253,
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Kodungallur, Azhicode, Kerala, India",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: ColorConstants.retrytxt),
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
