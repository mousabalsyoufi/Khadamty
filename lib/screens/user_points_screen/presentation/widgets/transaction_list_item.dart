import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text('Household', style: AppTextStyles.robotoBoldBlack(11.sp),),
            Text('01 March 2022', style: AppTextStyles.robotoRegularGrey50,),
          ],
        ),
        const Spacer(),
        Text('+', style: AppTextStyles.paragraphRobotoMedium.copyWith(
          color: AppColors.greenColor,
          fontSize: 10.sp,
        ),),
        Text('100pts', style: AppTextStyles.robotoMediumBlack.copyWith(
          fontSize: 10.sp,
        ),)
      ],
    );
  }
}
