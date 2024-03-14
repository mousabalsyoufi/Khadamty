import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/presentation/widgets/call_icon_button.dart';
import 'package:faciltateur_de_vies/shared_widgets/circle_image_with_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_widgets/custom_badge_counter.dart';

class ChatContactCardWidget extends StatelessWidget {
  final int count ;
  const ChatContactCardWidget({Key? key,required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321.w,
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(5.r))
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Stack(
              children: [
                 CircleImageWithBorder(url: 'https://freepngimg.com/thumb/man/10-man-png-image.png', width: 60.h, height: 60.h, borderColor: AppColors.greenColor, borderWidth: 3.r,),
                  Positioned(
                      top:2.h,
                      right: 1.w,
                      child: CustomBadgeCounter(count: count)),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Elliot Thomson",style: AppTextStyles.paragraphRobotoMedium,),
                SizedBox(height: 5.h,),
                Text("Major",style: AppTextStyles.paragraph3Roboto,)
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(end:20.w),
            child: CallIconButtonWidget(onPress: (){

            },),
          )
        ],
      ),
    );
  }
}
