import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/View/Get%20Started%20Screen/get_started_screen.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacement(_createRoute());
      },
    );
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const GetStartedScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(ImageConstants.LOGO_COLORED),
    ));
  }
}
