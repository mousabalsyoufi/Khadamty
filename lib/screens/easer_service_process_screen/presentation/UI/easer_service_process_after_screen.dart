import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';

import '../../../../shared_widgets/bottom_sheets/resource_bottom_sheet/resource_sheet.dart';
import '../widgets/custom_upload_photo.dart';

// this is a second screen in Report screens flow
class EaserServiceProcessAfterScreen extends StatelessWidget {
  const EaserServiceProcessAfterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 292.h,
          width: 320.w,
          color: AppColors.whiteColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Final debriefing",
                      style: AppTextStyles.header4Inter),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  textAlign: TextAlign.start,
                  minLines: 5,
                  maxCharacters: 280,
                  hintStyle: AppTextStyles.robotoRegularGrey50
                      .copyWith(fontSize: 12.sp),
                  textType: TextInputType.multiline,
                  maxLines: null,
                  prefix: SizedBox(width: 5.w),
                  hint: 'Everything went well',
                  borderColor: AppColors.grey10Color,
                  fillColor: AppColors.greyColor,
                ),
                /* SizedBox(height: 5.h,),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "280 characters max",
                      style: AppTextStyles.robotoRegularGrey50,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ), */
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    UploadPhotoWidget(
                      onTap: () {
                        ResourceBottomSheetImp
                            .showResourcePicker(context);
                      },
                    ),
                    UploadPhotoWidget(
                      onTap: () {
                        ResourceBottomSheetImp
                            .showResourcePicker(context);
                      },
                    ),
                    UploadPhotoWidget(
                      onTap: () {
                        ResourceBottomSheetImp
                            .showResourcePicker(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
