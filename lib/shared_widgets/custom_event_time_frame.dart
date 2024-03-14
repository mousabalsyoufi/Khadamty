import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_styles/text_styles.dart';

class CustomEventTimeFrame extends StatelessWidget {
  final String eventTime;
  final Color eventColor;
  final double height, width;
  const CustomEventTimeFrame(
      {Key? key,
      required this.width,
      required this.height,
      required this.eventColor,
      required this.eventTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: eventColor, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Center(
            child: Text(
              eventTime,
              style: AppTextStyles.header3Inter,
            ),
          ),
        ),
      ],
    );
  }
}
