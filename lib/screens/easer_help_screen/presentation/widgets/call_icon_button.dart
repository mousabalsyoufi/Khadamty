import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors/colors.dart';
class CallIconButtonWidget extends StatelessWidget {
  final Function onPress;
  const CallIconButtonWidget({Key? key,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35.h,
        width: 35.h,
        decoration:const  BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blackColor,
        ),
        child: IconButton(onPressed:()=> onPress, icon:Icon(Icons.call,color: AppColors.greenColor,size: 20.r)));
  }
}
