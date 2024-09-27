import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class items extends StatelessWidget {
  const items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: ColorConstants.mainwhite,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            width: 2,
                            color: ColorConstants.mainblack,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 2.1,
                          backgroundColor: ColorConstants.mainblack,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Bestseller",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Veg Burger",
                    style: TextStyle(
                      color: ColorConstants.mainblack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "₹144",
                    style: TextStyle(
                      color: ColorConstants.mainblack,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: ColorConstants.savetoearlier,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 6),
                        Icon(
                          Icons.bookmark,
                          size: 18,
                          color: ColorConstants.maingrey,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "Save to Eatlist",
                          style: TextStyle(color: ColorConstants.maingrey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 180,
                    child: Text(
                      "A yummy burger with a perfectly grilled patty, melted cheese, and fresh lettuce is the ultimate comfort food, satisfying every craving. Topped with ripe tomatoes, tangy pickles, and a dollop of creamy mayo, it’s a feast for the senses. Each bite is a delightful explosion of flavors that makes it hard to resist.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 10,
            child: Container(
              width: 170,
              height: 160,
              decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          Positioned(
              bottom: 30,
              right: 25,
              child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(120, 45)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {},
                  child: Text(
                    "ADD",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )))
        ],
      ),
    );
  }
}
