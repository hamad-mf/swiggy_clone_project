import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiggy_clone_project/View/Add%20Address/add_address.dart';
import 'package:swiggy_clone_project/View/Add%20New%20Address/add_new_adress.dart';
import 'package:swiggy_clone_project/View/Card%20Screen/card_screen.dart';
import 'package:swiggy_clone_project/View/Get%20Started%20Screen/get_started_screen.dart';
import 'package:swiggy_clone_project/View/dummy_db.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _profiledetails(),
              _expansionTiles(context),
              SizedBox(
                height: 20,
              ),
              _logOutOption(context)
            ],
          ),
        ),
      ),
    );
  }

  Row _logOutOption(BuildContext context) {
    return Row(
      children: [
        Text(
          "LOGOUT",
          style: TextStyle(
              color: ColorConstants.mainblack,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => GetStartedScreen()));
            },
            child: Icon(Icons.keyboard_arrow_right))
      ],
    );
  }

  Column _expansionTiles(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Row(
            children: [
              Image.asset(
                ImageConstants.ONE_LOGO,
                scale: 4,
              ),
              Text(
                "membership",
                style: TextStyle(color: ColorConstants.mainblack, fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 55,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstants.primaryColor),
                child: Center(
                  child: Text(
                    "BUY ONE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.mainwhite,
                        fontSize: 10),
                  ),
                ),
              )
            ],
          ),
          subtitle: Text(
              "Unlock the UNLIMITED free Deliveries on Food & Instamart, Buy Swiggy One"),
          trailing: Icon(Icons.keyboard_arrow_down),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.change_circle),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Buy Swiggy One",
                    style: TextStyle(
                        color: ColorConstants.retrytxt,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.featured_play_list),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Redeem Membership Coupon",
                    style: TextStyle(
                        color: ColorConstants.retrytxt,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
        Divider(
          thickness: 2,
        ),
        ExpansionTile(
          onExpansionChanged: (value) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CardScreen()));
          },
          title: Text(
            "Swiggy HDFC Bank Credit Card",
            style: TextStyle(color: ColorConstants.mainblack, fontSize: 15),
          ),
          subtitle:
              Text("Apply for the credit card and start earning cashbacks!"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        Divider(
          thickness: 2,
        ),
        ExpansionTile(
          title: Text(
            "My Account",
            style: TextStyle(color: ColorConstants.mainblack, fontSize: 15),
          ),
          subtitle: Text("Favorites, Hidden restaurents & settings"),
          trailing: Icon(Icons.keyboard_arrow_down),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.favorite_outline),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Favorites",
                    style: TextStyle(
                        color: ColorConstants.retrytxt,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.apartment),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Hidden restaurents",
                    style: TextStyle(
                        color: ColorConstants.retrytxt,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                        color: ColorConstants.retrytxt,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
        Divider(
          thickness: 2,
        ),
        ExpansionTile(
          title: Row(
            children: [
              Text(
                "My Eatlist",
                style: TextStyle(color: ColorConstants.mainblack, fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 35,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConstants.primaryColor),
                child: Center(
                  child: Text(
                    "NEW",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.mainwhite,
                        fontSize: 10),
                  ),
                ),
              )
            ],
          ),
          subtitle: Text("View all your saved list in one place"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        Divider(
          thickness: 2,
        ),
        ExpansionTile(
          onExpansionChanged: (value) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddNewAdress()));
          },
          title: Text(
            "Addresses",
            style: TextStyle(color: ColorConstants.mainblack, fontSize: 15),
          ),
          subtitle: Text("Share ,Edit & Add New Adress"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }

  Column _profiledetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HAMAD MF",
          style: TextStyle(
              color: ColorConstants.mainblack,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "+91 - ${DummyDb0.userddetails[0]["mobno"]}",
          style: TextStyle(
            color: ColorConstants.retrytxt,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Edit Profile >",
          style: TextStyle(
              color: ColorConstants.buttontxt,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 6,
        ),
      ],
    );
  }

  AppBar _appbar() {
    return AppBar(
      actions: [
        Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: ColorConstants.primaryColor.withOpacity(0.3)),
          child: Center(
            child: Text(
              "Help",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: ColorConstants.buttontxt),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
