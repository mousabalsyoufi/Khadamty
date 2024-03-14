import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors/colors.dart';
import '../constants/text_styles/text_styles.dart';
class CustomBadgeCounter extends StatelessWidget {
  final int count;
  const CustomBadgeCounter({Key? key,required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 15.h,
      width: 15.h,
      decoration:const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.greenColor,
      ),
      child: _counterWidget(),
    );
  }
  Widget _counterWidget(){
    if(count >= 100){
      return  Padding(
        padding:  EdgeInsets.all(1.r),
        child: Center(child: Icon(Icons.plus_one,color: AppColors.blackColor,size: 12.r,)),
      );
    }
     return Padding(
       padding:  EdgeInsets.all(1.r),
       child: Center(child: Text('$count',style: AppTextStyles.header5Inter.copyWith(fontSize: 9.sp),)),
     );
  }

}
