import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';
import 'package:swiggy_clone_project/View/Home%20Screen/home_screen.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
  bool _showbanner = true; //to show the banner with the otp
  int _timerseconds = 30; // time limit to show the otp banner
  Timer? _timer; //timer for the banner
  bool _showRetryButton = false; // to on or off the retry button
  Timer? _retryTimer; //timer  for to get the retry button visible
  int _retryTimerSeconds = 40; //set the time limit ot visible the retry button

  @override
  void initState() {
    super.initState();
    _starttimer(); //this will start the otp bannertime
    _startRetryTimer(); //this will start the retry button visibile timer
  }

  void _startRetryTimer() {
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
  void dispose() {
    _timer?.cancel(); //cancel the otp banner timer
    _retryTimer?.cancel(); // cancel the retry countodn timer
    super.dispose();
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
                                    SnackBar(
                                      content: Text("OTP verified"),
                                    ),
                                  );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                                otp: '',
                                              )));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("invalid OTP")),
                                  );
                                }
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15),
                          child: Row(
                            children: [
                              if (!_showRetryButton)
                                Text(
                                    "Didn't recieve it? Retry in $_retryTimerSeconds s"),
                              if (_showRetryButton)
                                Row(
                                  children: [
                                    Text(
                                      "Retry via:",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            minimumSize: WidgetStatePropertyAll(
                                                Size(50, 50)),
                                            shape: WidgetStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(6))),
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    const Color.fromARGB(
                                                            255, 239, 236, 209)
                                                        .withOpacity(0.1))),
                                        child: Text(
                                          "OTP",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          //reset both timers and show the banner agin
                                          setState(() {
                                            _showbanner =
                                                true; //this will show the banner again
                                            _timerseconds =
                                                30; // reset the otp banner time to 5 sec
                                            _retryTimerSeconds =
                                                40; //sets the retyr timer to 30 again
                                            _showRetryButton =
                                                false; //this will hide the retry button agi
                                          });
                                          _starttimer(); //restarts the otp banner time
                                          _startRetryTimer(); //restarts the retry  countowndn
                                        }),
                                  ],
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 250,
                    right: 0,
                    left: 0,
                    child: AnimatedOpacity(
                      opacity: _showbanner ? 1.0 : 00,
                      duration: Duration(milliseconds: 700),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 1,
                            ),
                            Text(
                              "Your OTP is   ${widget.otp}",
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
