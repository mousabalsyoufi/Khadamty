import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageListItem extends StatelessWidget {
  const ChatMessageListItem({Key? key, required this.sentMessageColor}) : super(key: key);

  final Color sentMessageColor;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: 1 == 1
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            1 == 1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 240.w),
            child: Container(
              decoration: BoxDecoration(
                color: 1 == 1 ? sentMessageColor: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              padding: EdgeInsets.all(15.r),
              child: Text(
                'hello',
                style: 1 == 1
                    ? AppTextStyles.robotoRegularWhite.copyWith(fontSize: 14.sp)
                    : AppTextStyles.robotoRegularBlack(14.sp),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            '11:20',
            style: AppTextStyles.paragraph3Roboto
                .copyWith(color: AppColors.grey70Color),
          ),
        ],
      ),
    );
  }
}
