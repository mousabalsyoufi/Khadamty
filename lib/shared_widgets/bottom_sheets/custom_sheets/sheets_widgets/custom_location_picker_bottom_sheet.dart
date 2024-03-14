import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/local_storage/storage_manager.dart';
import '../../../../shared_models/address_model.dart';
import '../../widgets/bottom_sheet_header.dart';

class CustomLocationPickerBottomSheet extends StatelessWidget {
  const CustomLocationPickerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AddressModel> addresses =
        AddressModel.fromJsonList(StorageManager.getUserAddresses()!);
    return Container(
      height: 380.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          const BottomSheetHeader(),
          SizedBox(
            height: 35.h,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  /* CustomRadioButton(
                      title: 'Current Position',
                      value: 1,
                      groupValue: 1,
                      hasPadding: false,
                      selectedTextStyle: AppTextStyles.header3Inter,
                      unselectedTextStyle: AppTextStyles.header3Inter,
                      onChanged: (value) {}),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(), */
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: List.generate(
                      addresses.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              RoutingProvider.goBack();
                            },
                            child: CustomRadioButton(
                                title: 'Address ${index + 1}',
                                value: 0,
                                groupValue: 1,
                                hasPadding: false,
                                selectedTextStyle: AppTextStyles.header3Inter,
                                unselectedTextStyle: AppTextStyles.header3Inter,
                                onChanged: (value) {
                                  RoutingProvider.goBack();
                                }),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              addresses[index].address,
                              style: AppTextStyles.interRegularBlack,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              children: [
                                Text(
                                  '${addresses[index].zip} ${addresses[index].town}',
                                  style: AppTextStyles.interRegularBlack,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: (() {
                      RoutingProvider.goBack();
                      RoutingProvider.pushNamed(
                          routeName: Routes.userAddressesScreen);
                    }),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add_circle_outline_rounded,
                          color: AppColors.blackColor,
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Text(
                          'Manage my addresses',
                          style: AppTextStyles.header3Inter,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
