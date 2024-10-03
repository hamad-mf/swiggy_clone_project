import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Global_widgets/add_button.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class items extends StatelessWidget {
  final String dishname;
  final String price;
  final String description;
  final String img;
  const items({
    required this.description,
    required this.dishname,
    required this.img,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String _selectedOption = 'Option 1';
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
                  Container(
                    width: 150,
                    child: Text(
                      "$dishname",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorConstants.mainblack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "₹$price",
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
                      "$description",
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
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return SizedBox(
                          height: 470,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 245,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(img))),
                                child: Stack(children: [
                                  Positioned(
                                    right: 16,
                                    top: 20,
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundColor: ColorConstants.mainwhite,
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Stack(children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: ColorConstants.mainwhite,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                            width: 2,
                                            color: ColorConstants.mainblack,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 2.1,
                                          backgroundColor:
                                              ColorConstants.mainblack,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Text(
                                              "$dishname",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: ColorConstants.mainblack,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              AddButton(
                                                ontap: () {},
                                              ),
                                              Text("Customisable")
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "₹$price",
                                        style: TextStyle(
                                          color: ColorConstants.mainblack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        width: 330,
                                        child: Text(
                                          "$description",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                width: 170,
                height: 160,
                decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage("$img")),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Positioned(
              bottom: 30,
              right: 25,
              child: AddButton(
                ontap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
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
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    color: ColorConstants.addpagebg,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 16,
                                          top: 20,
                                          child: CircleAvatar(
                                            radius: 13,
                                            backgroundColor:
                                                ColorConstants.mainwhite,
                                            child: Icon(Icons.close),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 18),
                                          child: Row(
                                            children: [
                                              Text(
                                                dishname,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstants.retrytxt,
                                                    fontSize: 17),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                radius: 2.1,
                                                backgroundColor:
                                                    ColorConstants.maingrey,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text("₹ $price")
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                            top: 45,
                                            left: 15,
                                            child: Text(
                                              "Customise as per ypur taste",
                                              style: TextStyle(
                                                  color:
                                                      ColorConstants.mainblack,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            )),
                                        Positioned(
                                            left: 15,
                                            top: 100,
                                            child: Container(
                                              height: 0.5,
                                              width: 365,
                                              color: ColorConstants.maingrey,
                                            )),
                                        Positioned(
                                          top: 120,
                                          left: 15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Size",
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .mainblack,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "select any 1",
                                                style: TextStyle(
                                                    color:
                                                        ColorConstants.retrytxt,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 16),
                                                width: 360,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: ColorConstants
                                                        .mainwhite),
                                                child: Column(
                                                  children: [
                                                    Stack(children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            height: 20,
                                                            width: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  ColorConstants
                                                                      .mainwhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              border:
                                                                  Border.all(
                                                                width: 2,
                                                                color: ColorConstants
                                                                    .mainblack,
                                                              ),
                                                            ),
                                                            child: CircleAvatar(
                                                              radius: 2.1,
                                                              backgroundColor:
                                                                  ColorConstants
                                                                      .mainblack,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 12,
                                                          ),
                                                          Text("350 ML"),
                                                          Spacer(),
                                                          Radio<String>(
                                                            value: 'Option 2',
                                                            groupValue:
                                                                _selectedOption,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _selectedOption =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Stack(children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            height: 20,
                                                            width: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  ColorConstants
                                                                      .mainwhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              border:
                                                                  Border.all(
                                                                width: 2,
                                                                color: ColorConstants
                                                                    .mainblack,
                                                              ),
                                                            ),
                                                            child: CircleAvatar(
                                                              radius: 2.1,
                                                              backgroundColor:
                                                                  ColorConstants
                                                                      .mainblack,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 12,
                                                          ),
                                                          Text("350 ML"),
                                                          Spacer(),
                                                          Radio<String>(
                                                            value: 'Option 1',
                                                            groupValue:
                                                                _selectedOption,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _selectedOption =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
