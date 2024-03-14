import 'package:faciltateur_de_vies/constants/images/images.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/text_styles/text_styles.dart';

class RatingHistoryBottomSheet{
  static void showRatingHistoryConfirmationBottomSheet(BuildContext context) {
    // show Rating History Confirmation Bottom sheet
    return CustomSheets.showIconTextTextButtonBottomSheet
      (headlineText: 'Thank you!', context: context,
        borderColor: AppColors.blackColor,
        acceptButtonStyle: AppTextStyles.robotoMediumWhite
            .copyWith(fontSize: 16.sp),
    acceptButtonColor: AppColors.blackColor,
      acceptButtonTapFunction: (){
          RoutingProvider.goBack();
      },
      acceptButtonText: 'OK',
      buttonWidth: 320.w,
      contentText: 'Your evaluation allows us to improve our services.',
      iconPath: AppImages.confirmationImage
    );

  }
}