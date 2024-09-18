import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class CommonButton extends StatelessWidget {
  final String buttonText; // Add a buttonText parameter
  final VoidCallback onPressed; // Add an onPressed parameter
  final double width;
  final double height;

  const CommonButton({
    super.key,
    this.height = 60,
    this.width = 350,
    required this.buttonText, // Require buttonText to be passed
    required this.onPressed, // Require onPressed to be passed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Use the onPressed parameter
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(width, height)),
        backgroundColor: WidgetStatePropertyAll(ColorConstants.primaryColor),
        foregroundColor: WidgetStatePropertyAll(ColorConstants.mainwhite),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      child: Text(buttonText), // Use the buttonText parameter
    );
  }
}
