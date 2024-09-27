import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Hotel%20Items%20Screen/hotel_items_screen.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class fooditems_card extends StatelessWidget {
  final String img;
  final String rating;
  final String ratingC;
  final String name;
  final String time;
  final String distance;
  final String location;
  final String type;
  const fooditems_card({
    required this.distance,
    required this.location,
    required this.rating,
    required this.ratingC,
    required this.type,
    required this.img,
    required this.name,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HotelItemsScreen(
              distance: distance,
              location: location,
              type: type,
              time: time,
              rating: rating,
              ratingC: ratingC,
              name: name,
            )));
      },
      child: Container(
        height: 206,
        width: 125,
        decoration: BoxDecoration(
          color: ColorConstants.mainwhite,
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 0),
              child: Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(img))),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "₹100 OFF",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.mainwhite),
                        ),
                        Text(
                          "  ABOVE ₹159",
                          style: TextStyle(
                              fontSize: 11, color: ColorConstants.buttonbg),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          color: ColorConstants.mainblack,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$time mins",
                          style: TextStyle(color: ColorConstants.retrytxt),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
