import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/business_logic/provider/user_addresses_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/scroll_glow_removed.dart';
import '../../../../routes/routes_names/routes_names.dart';

class UserAddressesScreen extends StatefulWidget {
  const UserAddressesScreen({Key? key}) : super(key: key);

  @override
  State<UserAddressesScreen> createState() => _UserAddressesScreenState();
}

class _UserAddressesScreenState extends State<UserAddressesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserAddressesProvider>(context, listen: false).getAddresses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('My addresses'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Consumer<UserAddressesProvider>(builder: (context, provider, _) {
          if (provider.isLoading) {
            return const CustomProgressIndicator(color: AppColors.blackColor);
          } else if (!provider.isLoading && !provider.isError) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                if (provider.addresses.length < 2)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacePicker(
                            apiKey: Consts.mapKey,
                            onPlacePicked: (result) {
                              RoutingProvider.pushNamed(
                                  routeName: Routes.userAddAddressScreen,
                                  arguments: result);
                            },
                            initialPosition: const LatLng(47.7516, 1.6751),
                            useCurrentLocation: true,
                            resizeToAvoidBottomInset:
                                false, // remove this line, if map offsets are wrong
                          ),
                        ),
                      );
                      /* RoutingProvider.pushNamed(
                          routeName: Routes.userAddAddressMapScreen); */
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.blackColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Add a new address',
                            style: AppTextStyles.robotoBoldBlack(12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                if (provider.addresses.length < 2)
                  SizedBox(
                    height: 20.h,
                  ),
                Container(
                  height: provider.addresses.length == 1
                      ? 120.h
                      : provider.addresses.length == 2
                          ? 240.h
                          : 0,
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: ScrollConfiguration(
                    behavior: ScrollGlowRemoved(),
                    child: ListView.builder(
                      itemBuilder: ((context, index) => Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Address ${index + 1}',
                                          style: AppTextStyles.header3Inter,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          provider.addresses[index].address,
                                          style:
                                              AppTextStyles.interRegularBlack,
                                        ),
                                        Text(
                                          '${provider.addresses[index].zip} ${provider.addresses[index].town}',
                                          style:
                                              AppTextStyles.interRegularBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      CustomSheets
                                          .showIconTextButtonBottomSheet(
                                              context: context,
                                              iconPath: AppIcons.removeIcon,
                                              contentText:
                                                  'Are you sure to delete the address?',
                                              buttonText: 'Delete',
                                              buttonTapFunction: () async {
                                                String deleteResult =
                                                    await provider
                                                        .deleteAddress(
                                                            id: provider
                                                                .addresses[
                                                                    index]
                                                                .id);
                                                if (deleteResult.isNotEmpty) {
                                                  provider.removeAddress(index);
                                                }
                                                RoutingProvider.goBack();
                                              });
                                    },
                                    child: SvgPicture.asset(
                                      AppIcons.removeIcon,
                                      width: 30.h,
                                      height: 30.h,
                                    ),
                                  ),
                                ],
                              ),
                              if (index == 0 && provider.addresses.length > 1)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 15.h,
                                    )
                                  ],
                                ),
                            ],
                          )),
                      itemCount: provider.addresses.length >= 2
                          ? 2
                          : provider.addresses.length,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
