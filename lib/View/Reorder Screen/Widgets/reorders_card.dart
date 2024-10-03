import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/dummy_db.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class ReordersCard extends StatelessWidget {
  final String hotelname;
  final String foodname;
  final String time;
  final String price;
  final String foodimg;
  const ReordersCard({
    required this.foodimg,
    required this.time,
    required this.price,
    required this.foodname,
    required this.hotelname,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorConstants.mainwhite),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _mainContainerFirstSecction(),
            _mainContainerSecondSection(context)
          ],
        ),
      ),
    );
  }

  Padding _mainContainerSecondSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        children: [
          Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
                border:
                    Border.all(color: ColorConstants.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(2)),
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 10,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(foodname),
              SizedBox(
                height: 5,
              ),
              Text(
                price,
                style: TextStyle(color: ColorConstants.mainblack),
              )
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              bool _isChecked = false;
              _bottomsheet(context, _isChecked);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: ColorConstants.maingrey, width: 1)),
              child: Icon(
                Icons.add,
                size: 22,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _mainContainerFirstSecction() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          color: ColorConstants.lightblue.withOpacity(0.7)),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      foodimg,
                    )),
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 14)),
              Row(
                children: [
                  Text(
                    hotelname,
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  CircleAvatar(
                    radius: 2.1,
                    backgroundColor: ColorConstants.mainblack,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "$time Mins",
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    width: 115,
                  ),
                  Icon(
                    size: 17,
                    Icons.favorite,
                    color: Colors.red,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.sell,
                    color: ColorConstants.primaryColor,
                    size: 18,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "₹100 off above ₹199",
                    style:
                        TextStyle(color: ColorConstants.retrytxt, fontSize: 12),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> _bottomsheet(BuildContext context, bool _isChecked) {
    return showModalBottomSheet(
      backgroundColor: ColorConstants.lightblue,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return SizedBox(
              height: 600,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Maxican Grill Wrap',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: ColorConstants.mainwhite,
                              child: Icon(Icons.close),
                            )
                          ],
                        ),
                        Text(
                          "Customize as per your taste",
                          style: TextStyle(
                              color: ColorConstants.mainblack,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Add Ons",
                          style: TextStyle(
                              color: ColorConstants.mainblack,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'select up to 15',
                          style: TextStyle(
                              color: ColorConstants.retrytxt, fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorConstants.mainwhite),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 275,
                                child: ListView.separated(
                                    itemBuilder: (context, index) => Row(
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      scale: 70,
                                                      image: AssetImage(
                                                        ImageConstants
                                                            .BESTSELLER,
                                                      )),
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Bun"),
                                            Spacer(),
                                            Text("+₹25"),
                                            Checkbox(
                                              activeColor:
                                                  ColorConstants.primaryColor,
                                              checkColor:
                                                  ColorConstants.mainwhite,
                                              value: _isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  _isChecked = value!;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: 6),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
