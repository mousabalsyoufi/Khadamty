import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/local_storage/storage_manager.dart';
import '../../../../shared_models/address_model.dart';
import '../../../../shared_widgets/bottom_sheets/service_address_bottom_sheet/service_address_bottom_sheet.dart';
import '../../../../shared_widgets/custom_black_button_with_title.dart';
import '../../business_logic/provider/user_service_subscribe_process_provider.dart';
import '../widgets/service_subscribe_process_screen_header.dart';

class UserServiceProcessAddAddressScreen extends StatelessWidget {
  UserServiceProcessAddAddressScreen({Key? key}) : super(key: key);

  List<AddressModel> addresses =
      AddressModel.fromJsonList(StorageManager.getUserAddresses()!);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserServiceSubscribeProcessProvider>(
        builder: (context, subscribeServiceProvider, child) {
      if (addresses.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          subscribeServiceProvider.setServiceAddress(addresses[0]);
        });
      }
      return SafeArea(
        child: Scaffold(
          body: Scaffold(
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: CustomButtonBlackWithText(
                buttonText: "Continue",
                onPressed: subscribeServiceProvider.addressButtonEnabled
                    ? () {
                        RoutingProvider.pushNamed(
                            routeName: Routes
                                .userServiceSubscibeSharedServiceCheckoutScreen);
                      }
                    : null,
                trailingText: '${subscribeServiceProvider.getServicePrice()}€',
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const ServiceSubscribeProcessScreenHeader(percent: 0.65),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pick your address",
                          style: AppTextStyles.header3Inter,
                        ),
                        InkWell(
                            onTap: () {
                              ServiceAddressBottomSheet
                                  .showServiceAddressBottomSheet(context,
                                      (address) {
                                subscribeServiceProvider
                                    .setServiceAddress(address);
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
                    /*  if (subscribeServiceProvider.fillData == false)
                      InkWell(
                        onTap: () {
                          subscribeServiceProvider.setDataFilled(true);
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
                    filledAddressData(subscribeServiceProvider),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget filledAddressData(UserServiceSubscribeProcessProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  provider.serviceAddress != null ? 'Address' : '',
                  style: AppTextStyles.header4Inter,
                ),
                Text(
                  provider.serviceAddress != null
                      ? '${provider.serviceAddress!.address}\n${provider.serviceAddress!.zip} ${provider.serviceAddress!.town}'
                      : '',
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
                Text(
                  provider.serviceAddress != null
                      ? '${provider.serviceAddress!.arrayOptions.surface} m2'
                      : '',
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Enter your instructions",
          style: AppTextStyles.header3Inter,
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextField(
          maxCharacters: 280,
          prefix: SizedBox(width: 5.w),
          onChange: (instructions) {
            provider.setServiceInstructions(instructions);
          },
          suffix: Padding(
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 20.h)),
          hint:
              'Mode of access, presence of animals, where to find the equipment…',
          hintStyle:
              AppTextStyles.robotoRegularGrey50.copyWith(fontSize: 12.sp),
          textType: TextInputType.multiline,
          minLines: 8,
        ),
      ],
    );
  }
}
