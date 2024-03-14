import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/text_styles/text_styles.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextField(
            width: 266.w,
            borderColor: AppColors.grey40Color,
            hint: 'Type your message',
            hintStyle: AppTextStyles.paragraph2Roboto
                .copyWith(color: AppColors.grey40Color),
          ),
          GestureDetector(
            onTap: (() {}),
            child: SvgPicture.asset(
              AppIcons.sendMessageIcon,
              width: 45.r,
              height: 45.r,
            ),
          ),
        ],
      ),
    );
  }
}
