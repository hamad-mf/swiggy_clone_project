import 'dart:math';
import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';

import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

import 'package:swiggy_clone_project/View/otp Verification Screen/otp_verification_screen.dart';

import 'package:swiggy_clone_project/View/Home Screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobilenocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 65, right: 25),
        child: _uiElements(context),
      ),
    );
  }

  Column _uiElements(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                size: 30,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(110, 50)),
                    backgroundColor:
                        WidgetStatePropertyAll(ColorConstants.mainblack),
                    foregroundColor:
                        WidgetStatePropertyAll(ColorConstants.mainwhite),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                otp: '',
                              )));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: ColorConstants.mainwhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Enter your mobile\nnumber to get OTP",
          style: TextStyle(
              color: ColorConstants.mainblack,
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _mobilenocontroller,
          decoration: InputDecoration(
            labelText: "Mobile Number",
            labelStyle: TextStyle(
                color: ColorConstants.primaryColor), // Set the label text
            floatingLabelBehavior:
                FloatingLabelBehavior.always, // Ensure label is always visible
            hintText: "10 digit mobile number",
            prefix: Text(
              "+91  |  ",
              style: TextStyle(
                color: ColorConstants.mainblack,
                fontWeight: FontWeight.bold,
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
          keyboardType: TextInputType.phone,
        ),
        SizedBox(
          height: 30,
        ),
        CommonButton(
          buttonText: "Get OTP",
          onPressed: () {
            if (_mobilenocontroller.text.length == 10) {
              Random random = Random();
              String otp = (random.nextInt(900000) + 100000)
                  .toString(); //generating random otp

              //navigating

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpVerificationScreen(
                            otp: otp,
                            mobno: _mobilenocontroller.text,
                          )));
            } else {
              //error message
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("please enter a valid mobile no")));
            }
          },
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
            text: TextSpan(
                text: "By clicking, i accept the ",
                style: TextStyle(
                  fontSize: 15,
                  color: ColorConstants.mainblack,
                ),
                children: [
              TextSpan(
                  text: "terms of service ",
                  style: TextStyle(
                      color: ColorConstants.mainblack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
              TextSpan(
                text: "and",
                style: TextStyle(
                  color: ColorConstants.mainblack,
                ),
              ),
              TextSpan(
                  text: "\nprivacy policy",
                  style: TextStyle(
                      color: ColorConstants.mainblack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline))
            ]))
      ],
    );
  }
}
