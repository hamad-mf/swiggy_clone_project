import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiggy_clone_project/View/dummy_db.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<String> sampleTextList = [
    "I used my Swiggy card cashback to have a free pizza party with my friends",
    "Explore the Carousel Slider",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.SCAFFOLD_BG,
      floatingActionButton: _applyNowButton(),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: ColorConstants.mainwhite,
        ),
        backgroundColor: Color.fromARGB(255, 83, 67, 173),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _gradientedBGContainer(),
            Image.asset(ImageConstants.CARD_CASHBACK),
            SizedBox(
              height: 20,
            ),
            Text(
              "Bonus Benefits",
              style: TextStyle(
                  color: ColorConstants.mainblack,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            _bonusBenifitsCards(),
            Text(
              "See all Mastercard benefits >",
              style: TextStyle(
                  color: ColorConstants.buttontxt,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            _userExperienceCardsSection(),
            SizedBox(
              height: 30,
            ),
            Text(
              "Key details",
              style: TextStyle(
                  color: ColorConstants.mainblack,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: 40,
            ),
            _KeyDetailsCardSection(),
            SizedBox(
              height: 20,
            ),
            Text(
              "View all details >",
              style: TextStyle(
                  color: ColorConstants.buttontxt,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "To view the entire credit card product range with other nwtwork option,",
                style: TextStyle(color: ColorConstants.retrytxt, fontSize: 10),
              ),
            ),
            Center(
                child: RichText(
                    text: TextSpan(
                        text: "please visit ",
                        style: TextStyle(
                            color: ColorConstants.retrytxt, fontSize: 10),
                        children: <TextSpan>[
                  TextSpan(
                      text: "www.hdfcbank.com",
                      style: TextStyle(
                          color: ColorConstants.mainblack,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline))
                ]))),
            SizedBox(
              height: 30,
            ),
            _bottomTextsContainer(),
          ],
        ),
      ),
    );
  }

  Container _bottomTextsContainer() {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(color: ColorConstants.mainwhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: Text(
              "Live\nit up!",
              style: GoogleFonts.teko(
                  textStyle: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.liveitup,
                      height: 0.8)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "Created with 💓 in Benaluru, India",
              style: GoogleFonts.teko(
                  textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: ColorConstants.liveitup,
                      height: 0.8)),
            ),
          ),
        ],
      ),
    );
  }

  Column _KeyDetailsCardSection() {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: DummyDB6.keydetails.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  height: 200,
                  width: 340,
                  decoration: BoxDecoration(
                      color: ColorConstants.mainwhite,
                      // border: Border.all(
                      //     width: 1,
                      //     color: ColorConstants.mainblack.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DummyDB6.keydetails[index]["title"],
                        style: TextStyle(
                            color: ColorConstants.mainblack,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorConstants.mainblack,
                            radius: 2.2,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            DummyDB6.keydetails[index]["p1"],
                            style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorConstants.mainblack,
                            radius: 2.2,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            DummyDB6.keydetails[index]["p2"],
                            style: TextStyle(
                                color: ColorConstants.mainblack,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        DummyDB6.keydetails[index]["bottomtext"],
                        style: TextStyle(
                            color: ColorConstants.mainblack,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
                // enlargeFactor: 0.1,
                height: 230,
                autoPlay: false,
                enlargeCenterPage: false,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9)),
      ],
    );
  }

  Container _userExperienceCardsSection() {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(color: ColorConstants.mainwhite),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          Text(
            "What card holders are saying",
            style: TextStyle(
                color: ColorConstants.mainblack,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          SizedBox(
            height: 30,
          ),
          CarouselSlider.builder(
              itemCount: DummyDB5.userReviews.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  padding: EdgeInsets.all(12),
                  height: 200,
                  width: 340,
                  decoration: BoxDecoration(
                      color: ColorConstants.mainwhite,
                      border: Border.all(
                          width: 1,
                          color: ColorConstants.mainblack.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${DummyDB5.userReviews[index]["review"]}",
                        style: TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "${DummyDB5.userReviews[index]["name_place"]}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 210,
                        height: 30,
                        decoration:
                            BoxDecoration(color: ColorConstants.lightblue),
                        child: Text(
                            "✨ Saved ${DummyDB5.userReviews[index]["saved"]} last month"),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  // enlargeFactor: 0.1,
                  height: 230,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1)),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: 340,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor),
                borderRadius: BorderRadius.circular(12),
                color: ColorConstants.WHITE_DIM1),
            child: Row(
              children: [
                Image.asset(
                  ImageConstants.MONEY,
                  scale: 12,
                ),
                Text(
                  "Find out how much you can\nsave with this card",
                  style: TextStyle(
                      color: ColorConstants.mainblack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _bonusBenifitsCards() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            height: 105,
            decoration: BoxDecoration(
                color: ColorConstants.mainwhite,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Image.asset(
                  ImageConstants.FLAG,
                  scale: 4,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Golf Access",
                      style: TextStyle(
                          color: ColorConstants.mainblack,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "To courses across the globe\n& 12 free lessons/year",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            height: 105,
            decoration: BoxDecoration(
                color: ColorConstants.mainwhite,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Image.asset(
                  ImageConstants.BED,
                  scale: 4,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stay & Dine",
                      style: TextStyle(
                          color: ColorConstants.mainblack,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "Free 1 night stay* & dining benefits\nat select places globaly",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _gradientedBGContainer() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 83, 67, 173),
            Color(0xff322288),
            Color(0xffe47b35),
            Color(0xffffffff)
          ],
          stops: [0.0, 0.3, 1.1, 0.4], // Positions for gradient stops
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Swiggy HDFC bank Credit Card",
              style: TextStyle(fontSize: 18, color: ColorConstants.mainwhite),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "First year free ✨",
              style: GoogleFonts.teko(
                  textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.FYF,
                      height: 0.8)),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              width: 350,
              height: 40,
              color: ColorConstants.mainwhite,
              child: Text(
                "only for selected customers like you !",
                style: TextStyle(
                    color: ColorConstants.mainblack,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 70),
            Transform.rotate(
              angle: -pi / 16,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/swiggy_cc.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            _offersContainer(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container _offersContainer() {
    return Container(
      width: 400,
      height: 350,
      decoration: BoxDecoration(
          color: ColorConstants.mainwhite,
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageConstants.SPARKLE,
                  scale: 5,
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Flat 10% cashback*",
                          style: TextStyle(
                              color: ColorConstants.mainblack,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "On Food,Instamart,Dineout!",
                          style: TextStyle(color: ColorConstants.retrytxt),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Image.asset(
                      ImageConstants.SWIGGY_TXT_LOGO,
                      scale: 7,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageConstants.SPARKLE,
                  scale: 5,
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Flat 5% cashback*",
                          style: TextStyle(
                              color: ColorConstants.mainblack,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "On 1000+ online shopping\napps",
                          style: TextStyle(color: ColorConstants.retrytxt),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 57,
                    ),
                    Image.asset(
                      ImageConstants.MULTIPLE_LOGOS,
                      scale: 7,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageConstants.SPARKLE,
                  scale: 5,
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FREE 3 month Swiggy One",
                          style: TextStyle(
                              color: ColorConstants.mainblack,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "On 1000+ online shopping\napps",
                          style: TextStyle(color: ColorConstants.retrytxt),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Image.asset(
                      ImageConstants.ONE_LOGO,
                      scale: 3,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Know More >",
              style: TextStyle(
                  color: ColorConstants.buttontxt,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _applyNowButton() {
    return SizedBox(
      height: 60,
      width: 360,
      child: FloatingActionButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Apply Now",
              style: TextStyle(color: ColorConstants.mainwhite, fontSize: 17),
            ),
            Text(
              "Only takes a few minutes",
              style: TextStyle(
                color: ColorConstants.mainwhite,
              ),
            )
          ],
        ),
        backgroundColor: ColorConstants.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
