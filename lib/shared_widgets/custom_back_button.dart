import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/colors.dart';
import '../routes/routes_provider/routes_provider.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    this.callBack,
    Key? key,
  }) : super(key: key);

  final Function? callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 35.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: IconButton(
        onPressed: () {
          if(callBack != null) {callBack!();}else {
            RoutingProvider.goBack();
          }
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.blackColor,
          size: 20,
        ),
      ),
    );
  }
}
