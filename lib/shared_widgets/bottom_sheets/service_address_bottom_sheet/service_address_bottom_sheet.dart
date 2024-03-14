import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/text_styles/text_styles.dart';
import '../../custom_radio_button.dart';
import '../widgets/bottom_sheet_header.dart';

class ServiceAddressBottomSheet {
  static void showServiceAddressBottomSheet(
      BuildContext context, Function(AddressModel) changeAddress) {
    List<AddressModel> addresses =
        AddressModel.fromJsonList(StorageManager.getUserAddresses()!);
    // show addresses to pick address for service bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const BottomSheetHeader(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 40.h),
                      child: Column(
                        children: [
                          Text(
                            'Choose your address',
                            style: AppTextStyles.header3Inter,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const Divider(
                            color: AppColors.greyColor,
                            thickness: 3,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          ...List.generate(
                            addresses.length,
                            (index) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    changeAddress(addresses[index]);
                                    RoutingProvider.goBack();
                                  },
                                  child: CustomRadioButton(
                                      title: 'Address ${index + 1}',
                                      value: 0,
                                      groupValue: 1,
                                      hasPadding: false,
                                      selectedTextStyle:
                                          AppTextStyles.header3Inter,
                                      unselectedTextStyle:
                                          AppTextStyles.header3Inter,
                                      onChanged: (value) {
                                        changeAddress(addresses[index]);
                                        RoutingProvider.goBack();
                                      }),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Text(
                                    addresses[index].address,
                                    style: AppTextStyles.interRegularBlack,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
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
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: (() {
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
                  ],
                ),
              )
            ],
          );
        });
  }
}
