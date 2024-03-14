import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallBottomSheetButton extends StatelessWidget {
  const SmallBottomSheetButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.buttonTextStyle,
      required this.buttonColor,
      required this.buttonWidth,
      required this.borderColor,
      })
      : super(key: key);
  final Color borderColor;
  final String buttonText;
  final Function onPressed;
  final Color buttonColor;
  final TextStyle buttonTextStyle;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          elevation: 0.0,
          minimumSize: Size(buttonWidth, 45.h),
          side: BorderSide(
            width: 1.w,
            color: borderColor,
          )),
      child: Text(
        buttonText,
        style: buttonTextStyle,
      ),
    );
  }
}
