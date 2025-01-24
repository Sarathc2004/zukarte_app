import 'package:flutter/material.dart';
import 'package:zukarte_app/Core/colors.dart';

class Elevatedbutton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const Elevatedbutton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed, // Assign the onPressed callback
        style: ElevatedButton.styleFrom(
          backgroundColor: colorconstant.purple,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
