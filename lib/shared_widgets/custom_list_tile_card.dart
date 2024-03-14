import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTileCardWidget extends StatelessWidget {
  final String iconName;
  final String title;
    final bool trailingIcon;
    final Function onPress;
    final bool isLastItem;
  const CustomListTileCardWidget({Key? key,
    required this.isLastItem,
    required this.onPress,
    required this.title,required this.trailingIcon,required this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onPress();},
      child: Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            SizedBox(
              height: 63.h,
              child: Center(
                child: ListTile(
                  leading:SvgPicture.asset(iconName,height: 30.h,width: 30.h,fit: BoxFit.cover,),
                  title:Text(title,style: AppTextStyles.header4Inter,),
                  trailing:trailingIcon?Icon(Icons.arrow_forward,color: AppColors.blackColor,size: 16.r,):null,
                ),
              ),
            ),
            if(!isLastItem)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 1.h,
              color: AppColors.greyColor,
            )
          ],
        ),
      ),
    );
  }
}
