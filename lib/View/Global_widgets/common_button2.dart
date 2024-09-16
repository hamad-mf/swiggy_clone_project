import 'package:flutter/material.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class common_button2 extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isIconNeeded;
  final IconData iconname;

  const common_button2({
    required this.buttonText, // Require buttonText to be passed
    required this.onPressed,
    this.isIconNeeded = false,
    this.iconname = Icons.abc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            side: WidgetStatePropertyAll(BorderSide(
          color: ColorConstants.retrytxt.withOpacity(0.3),
        ))),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              buttonText,
              style: TextStyle(
                color: ColorConstants.mainblack,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            if (isIconNeeded)
              Icon(
                iconname,
                color: ColorConstants.mainblack,
              )
          ],
        ));
  }
}
