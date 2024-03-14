import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomDivider extends StatelessWidget {
  final Color color;
  const CustomDivider({Key? key,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 4.h,
      width: 10.w,
    );
  }
}
