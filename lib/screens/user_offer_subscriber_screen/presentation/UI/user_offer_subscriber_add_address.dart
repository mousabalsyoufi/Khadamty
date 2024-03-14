import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/local_storage/storage_manager.dart';
import '../../../../shared_models/address_model.dart';
import '../../../../shared_widgets/bottom_sheets/service_address_bottom_sheet/service_address_bottom_sheet.dart';

class UserOfferSubscriberAddAddressScreen extends StatelessWidget {
  UserOfferSubscriberAddAddressScreen({Key? key}) : super(key: key);

  List<AddressModel> addresses =
      AddressModel.fromJsonList(StorageManager.getUserAddresses()!);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<UserOfferSubscriberProvider>(
          builder: (context, provider, _) {
        if (addresses.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            provider.setOfferAddress(addresses[0]);
          });
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pick your address",
                  style: AppTextStyles.header3Inter,
                ),
                InkWell(
                    onTap: () {
                      ServiceAddressBottomSheet.showServiceAddressBottomSheet(
                          context, (address) {
                        provider.setOfferAddress(address);
                      });
                    },
                    child: Text(
                      "Change",
                      style: AppTextStyles.header4Inter,
                    ))
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            /* if (provider.fillData == false)
                InkWell(
                  onTap: () {
                    provider.setDataFilled(true);
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
                            "Add address",
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
                ), */
            filledAddressData(provider),
          ],
        );
      }),
    );
  }

  Widget filledAddressData(UserOfferSubscriberProvider provider) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Container(
          height: 119.h,
          width: 320.w,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  provider.offerAddress != null ? 'Address' : '',
                  style: AppTextStyles.header4Inter,
                ),
                Text(
                  provider.offerAddress != null
                      ? '${provider.offerAddress!.address}\n${provider.offerAddress!.zip} ${provider.offerAddress!.town}'
                      : '',
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
                Text(
                  provider.offerAddress != null
                      ? '${provider.offerAddress!.arrayOptions.surface} m2'
                      : '',
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        /*  CustomTextField(
            prefix: SizedBox(width: 5.w),
            maxCharacters: 280,
            suffix: Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w, top: 20.h)),
            hint:
                'Mode of access, presence of animals, where to find the equipment…',
            hintStyle:
                AppTextStyles.robotoRegularGrey50.copyWith(fontSize: 12.sp),
            textType: TextInputType.multiline,
            minLines: 8,
          ), */
      ],
    );
  }
}
