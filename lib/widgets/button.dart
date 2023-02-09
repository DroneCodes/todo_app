import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? press;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  final double height, width;

  const CustomButton(
      {Key? key,
        this.press,
        required this.backgroundColor,
        required this.borderColor,
        required this.text,
        required this.textColor, required this.height, required this.width,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: TextButton(
        onPressed: press,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          width: width,
          height: height,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}