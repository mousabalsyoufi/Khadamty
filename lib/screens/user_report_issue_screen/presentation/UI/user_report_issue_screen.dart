import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/data/model/service_history_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/images/images.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import '../../../../shared_widgets/bottom_sheets/resource_bottom_sheet/resource_sheet.dart';
import '../../../../shared_widgets/bottom_sheets/user_tickets_category_bottom_sheet/user_tickets_category_bottom_sheet.dart';
import '../../../../shared_widgets/custom_back_button.dart';
import '../../../../shared_widgets/custom_input_text.dart';
import '../../../easer_service_process_screen/presentation/widgets/custom_upload_photo.dart';
import '../../../user_bookings_screen/presentation/widgets/history_event_list_item.dart';

class UserReportIssueScreen extends StatelessWidget {
  const UserReportIssueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                const CustomBackButton(),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  "Report an issue",
                  style: AppTextStyles.header4Inter,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor),
                  borderRadius: BorderRadius.all(Radius.circular(1.r))),
              child: HistoryEventListItem(
                serviceHistory: serviceHistoryList[0],
                bottomSheet: true,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text("Topic", style: AppTextStyles.header4Inter),
            SizedBox(
              height: 11.h,
            ),
            InkWell(
              onTap: () {
                UserTicketCategoriesBottomSheet
                    .showUserTicketCategoriesBottomSheet(context);
              },
              child: Container(
                width: 320.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.whiteColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select topic",
                        style: AppTextStyles.header5Inter,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 15.r,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text("Message", style: AppTextStyles.header4Inter),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              textAlign: TextAlign.start,
              minLines: 5,
              maxCharacters: 280,
              hintStyle:
                  AppTextStyles.robotoRegularGrey50.copyWith(fontSize: 12.sp),
              textType: TextInputType.multiline,
              maxLines: null,
              prefix: SizedBox(width: 5.w),
              hint: 'Let us know your problem here',
              borderColor: AppColors.grey10Color,
              fillColor: AppColors.whiteColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text("Attached pictures", style: AppTextStyles.header4Inter),
            SizedBox(
              height: 11.h,
            ),
            Container(
              height: 126.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: const BoxDecoration(color: AppColors.whiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadPhotoWidget(
                    onTap: () {
                      ResourceBottomSheetImp.showResourcePicker(context);
                    },
                  ),
                  UploadPhotoWidget(
                    onTap: () {
                      ResourceBottomSheetImp.showResourcePicker(context);
                    },
                  ),
                  UploadPhotoWidget(
                    onTap: () {
                      ResourceBottomSheetImp.showResourcePicker(context);
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButtonBlack(
                buttonContent: const Text( 'Send')  ,
                onPressed: () {
                  CustomSheets.showIconTextTextButtonBottomSheet(
                      headlineText: 'Thank you!',
                      context: context,
                      borderColor: AppColors.blackColor,
                      acceptButtonStyle: AppTextStyles.robotoMediumWhite
                          .copyWith(fontSize: 16.sp),
                      acceptButtonColor: AppColors.blackColor,
                      acceptButtonTapFunction: () {
                        RoutingProvider.pushNamedAndRemoveUntil(
                            routeName: Routes.userHistoryReviewScreen,
                            stopRoute: Routes.mainScreen,
                            arguments: true);
                      },
                      acceptButtonText: 'OK',
                      buttonWidth: 320.w,
                      contentText:
                          'Your evaluation allows us to improve our services.',
                      iconPath: AppImages.confirmationImage);
                }),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
