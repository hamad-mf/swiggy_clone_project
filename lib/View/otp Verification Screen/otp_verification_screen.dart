import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';

import 'package:swiggy_clone_project/View/Location%20Screen/location_screen.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  final String otp;
  final String mobno;

  OtpVerificationScreen({required this.mobno, required this.otp, super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController _otpcontroller = TextEditingController();

  bool _showRetryButton = false; // to on or off the retry button
  Timer? _retryTimer; //timer  for to get the retry button visible
  int _retryTimerSeconds = 5; //set the time limit ot visible the retry button
  bool _isOtpInvalid = false;

  void _showTopNotification() {
    Fluttertoast.showToast(
      msg: "Your OTP is   ${widget.otp}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP, // Positioning at the top
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void initState() {
    super.initState();

    _showTopNotification();
    _startRetryTimer(); //this will start the retry button visibile timer
  }

  _startRetryTimer() {
    //start the rerty countdown timer
    _retryTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_retryTimerSeconds > 0) {
        setState(() {
          _retryTimerSeconds--; //decrease the countdown in each 1 sec
        });
      } else {
        //what happens when the timer finishes
        setState(() {
          _showRetryButton = true; //this will show the retry button
        });
        _retryTimer?.cancel(); //to off the retry timer
      }
    });
  }

  @override
  void dispose() {
    _retryTimer?.cancel(); // cancel the retry countodn timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 65, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: _maintextsection(context),
        ),
      ),
    );
  }

  Column _maintextsection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(
          height: 10,
        ),
        Text(
          "Verify with OTP sent to\n${widget.mobno}",
          style: TextStyle(
              color: ColorConstants.mainblack,
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  _pincodefield(context),
                  if (_isOtpInvalid)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Uh Oh! The OTP you entered is invalid.",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  _continuebutton(context),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (!_showRetryButton)
                              Text(
                                  "Didn't recieve it? Retry in $_retryTimerSeconds s"),
                            if (_showRetryButton) _retryotpbuttons()
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 180,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _retryotpbuttons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Retry via:",
          style: TextStyle(fontSize: 16, color: ColorConstants.retrytxt),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                    backgroundColor:
                        WidgetStatePropertyAll(ColorConstants.buttonbg)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.sms_outlined,
                      color: ColorConstants.buttontxt,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "SMS",
                      style: TextStyle(
                        color: ColorConstants.buttontxt,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    _showTopNotification();

                    _isOtpInvalid = false;

                    _retryTimerSeconds = 5; //sets the retyr timer to 30 again
                    _showRetryButton =
                        false; //this will hide the retry button agi
                  });

                  _startRetryTimer(); //restarts the retry  countowndn
                }),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                    backgroundColor:
                        WidgetStatePropertyAll(ColorConstants.buttonbg)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.call_outlined,
                      color: ColorConstants.buttontxt,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Call",
                      style: TextStyle(
                        color: ColorConstants.buttontxt,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                onPressed: () {}),
          ],
        ),
      ],
    );
  }

  CommonButton _continuebutton(BuildContext context) {
    return CommonButton(
        buttonText: "Continue",
        onPressed: () {
          setState(() {
            if (_otpcontroller.text == widget.otp) {
              _isOtpInvalid = false; // means otp is valid

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocationScreen()));
            } else {
              _isOtpInvalid = true; //means otp is invalid
            }
          });
        });
  }

  PinCodeTextField _pincodefield(BuildContext context) {
    return PinCodeTextField(
      controller: _otpcontroller,
      length: 6,
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.all(5),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 60,
        fieldWidth: 50,
        activeColor: ColorConstants.primaryColor,
        inactiveColor: ColorConstants.maingrey,
        selectedColor: ColorConstants.primaryColor,
      ),
      keyboardType: TextInputType.number,
      appContext: context,
    );
  }
}
