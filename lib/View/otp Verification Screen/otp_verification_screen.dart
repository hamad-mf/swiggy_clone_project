import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';
import 'package:swiggy_clone_project/View/Home%20Screen/home_screen.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  final String otp;
  final String mobno;

  const OtpVerificationScreen(
      {required this.mobno, required this.otp, super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController _otpcontroller = TextEditingController();
  bool _showbanner = true;
  int _timerseconds = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _starttimer();
  }

  void _starttimer() {
    //this is the function to start the timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //decrease the timer every 1 sec

      if (_timerseconds > 0) {
        setState(() {
          _timerseconds--; //minus 1 sec from the time left
        });
      } else {
        _closebanner();
      }
    });
  }

  void _closebanner() {
    //this function is to clos the banner

    setState(() {
      _showbanner = false;
      _timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 65, right: 15),
        child: Column(
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
              height: 20,
            ),
            SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        PinCodeTextField(
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
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonButton(
                            buttonText: "Continue",
                            onPressed: () {
                              setState(() {
                                if (_otpcontroller.text == widget.otp) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("OTP verified")),
                                  );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(otp: '',)));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("invalid OTP")),
                                  );
                                }
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 35, right: 15),
                          child: Row(
                            children: [
                              Text("Did'nt recieve it? "),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _showbanner = true; // Reshow the banner
                                    _timerseconds =
                                        5; // Reset the timer seconds
                                  });
                                  _starttimer(); // Restart the timer
                                },
                                child: Text("retry"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 152,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 290,
                    right: 0,
                    left: 0,
                    child: AnimatedOpacity(
                      opacity: _showbanner ? 1.0 : 00,
                      duration: Duration(milliseconds: 700),
                      child: Container(
                        color: ColorConstants.primaryColor,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your OTP is ${widget.otp}",
                              style: TextStyle(
                                  color: ColorConstants.mainwhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "$_timerseconds s",
                              style: TextStyle(
                                  color: ColorConstants.mainwhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: _closebanner,
                                icon: Icon(
                                  Icons.close,
                                  color: ColorConstants.mainwhite,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
