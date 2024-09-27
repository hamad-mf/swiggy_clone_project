import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Hotel%20Items%20Screen/hotel_items_screen.dart';

import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class hotelscard extends StatelessWidget {
  final String cover;
  final String name;
  final String rating;
  final String ratingC;
  final String time;
  final String type;
  final String location;
  final String distance;
  const hotelscard({
    required this.cover,
    required this.distance,
    required this.location,
    required this.rating,
    required this.ratingC,
    required this.time,
    required this.type,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HotelItemsScreen(
                      distance: distance,
                      type: type,
                      location: location,
                      rating: rating,
                      time: time,
                      name: name,
                      ratingC: ratingC)));
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 185,
              color: Colors.white,
              child: Stack(children: [
                Positioned(
                  top: 30,
                  left: 190,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        child: Text(
                          "$name",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: ColorConstants.mainblack,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 9,
                            backgroundColor: ColorConstants.mainblack,
                            child: Icon(
                              Icons.star,
                              size: 15,
                              color: ColorConstants.mainwhite,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "$rating",
                            style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "($ratingC)",
                            style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 2.1,
                            backgroundColor: ColorConstants.mainblack,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$time mins",
                            style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Text(
                        "$type",
                        style: TextStyle(color: ColorConstants.retrytxt),
                      ),
                      Row(
                        children: [
                          Text(
                            "$location",
                            style: TextStyle(color: ColorConstants.retrytxt),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: ColorConstants.mainblack,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$distance",
                            style: TextStyle(color: ColorConstants.retrytxt),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Positioned(
              left: 15,
              child: Container(
                padding: EdgeInsets.only(left: 12, right: 9, top: 8, bottom: 8),
                height: 185,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(cover))),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.favorite_outline_outlined,
                        color: ColorConstants.mainwhite,
                        size: 25,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "FLAT DEAL",
                        style: TextStyle(
                          color: ColorConstants.mainwhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "₹100 OFF",
                        style: TextStyle(
                            color: ColorConstants.mainwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "ABOVE ₹199",
                          style: TextStyle(
                            color: ColorConstants.buttonbg,
                            fontSize: 11,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
