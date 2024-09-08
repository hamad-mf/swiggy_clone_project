import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Add%20Address/add_address.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';
import 'package:swiggy_clone_project/View/temp/temp.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class AllowNotification extends StatefulWidget {
  const AllowNotification({super.key});

  @override
  State<AllowNotification> createState() => _AllowNotificationState();
}

class _AllowNotificationState extends State<AllowNotification> {
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
                "Get updates on your\norder status",
                style: TextStyle(
                    color: ColorConstants.mainblack,
                    fontSize: 32,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8, right: 15),
              child: Text(
                  "Allow push notification to get real-time\nupdates on your order status",
                  style:
                      TextStyle(fontSize: 19, color: ColorConstants.retrytxt)),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: -60,
                    right: 20,
                    left: 10,
                    child: Container(
                      height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  ImageConstants.NOTIFICATION_SCRN_BG))),
                    ),
                  ),
                  Positioned(
                    bottom: 140,
                    right: 20,
                    left: 20,
                    child: CommonButton(
                        buttonText: "Turn on Notification",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: ColorConstants.mainblack,
                                    content: Text(
                                      "Allow Swiggy to access this device's notification?",
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
                                                      Temp()));
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
                    left: 170,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Temp()));
                      },
                      child: Text(
                        "Not Now",
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
