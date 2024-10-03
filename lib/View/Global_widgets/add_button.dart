import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final void Function()? ontap;
  const AddButton({
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(Colors.black),
            elevation: WidgetStatePropertyAll(8),
            minimumSize: WidgetStatePropertyAll(Size(120, 45)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        onPressed: ontap,
        child: Text(
          "ADD",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }
}
