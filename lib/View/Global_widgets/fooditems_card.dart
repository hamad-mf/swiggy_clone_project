import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class fooditems_card extends StatelessWidget {
  const fooditems_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      fit: BoxFit.cover,
                      image: AssetImage(ImageConstants.FI_ICECREAME))),
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
                children: [
                  Text(
                    "Amul Ice Cream Parlour",
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
                        "50-65 mins",
                        style: TextStyle(color: ColorConstants.retrytxt),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
