import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/phone_number_picker_field.dart';
import '../../buainess_logic/provider/user_add_address_provider.dart';

class UserAddAddressScreen extends StatefulWidget {
  const UserAddAddressScreen({Key? key, required this.pickedLocation})
      : super(key: key);

  final PickResult pickedLocation;

  @override
  State<UserAddAddressScreen> createState() => _UserAddAddressScreenState();
}

class _UserAddAddressScreenState extends State<UserAddAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController addressNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController surfaceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'FR', phoneNumber: "000000000");

  @override
  void initState() {
    addressController.text = widget.pickedLocation.formattedAddress!;
    zipController.text = widget
        .pickedLocation
        .addressComponents![widget.pickedLocation.addressComponents!.length - 1]
        .shortName;
    townController.text = widget
        .pickedLocation
        .addressComponents![widget.pickedLocation.addressComponents!.length - 3]
        .longName;
    super.initState();
  }

  @override
  void dispose() {
    addressController.dispose();
    addressNameController.dispose();
    zipController.dispose();
    townController.dispose();
    surfaceController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Enter the full address'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 19.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  padding: EdgeInsetsDirectional.only(
                      top: 12.h, start: 20.w, end: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address name",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: addressNameController,
                        fillColor: AppColors.grey10Color,
                        textInputAction: TextInputAction.next,
                        hint: 'House',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Address",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: addressController,
                        fillColor: AppColors.grey10Color,
                        textInputAction: TextInputAction.next,
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Zip code",
                                  style: AppTextStyles.robotoBoldBlack(12.sp)),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 73.w,
                                child: CustomTextField(
                                  controller: zipController,
                                  fillColor: AppColors.grey10Color,
                                  hint: '3500',
                                  maxCharacters: 6,
                                  textInputAction: TextInputAction.next,
                                  hintStyle: AppTextStyles.robotoRegularGrey50
                                      .copyWith(fontSize: 14.sp),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textType: TextInputType.number,
                                  onValid: (value) =>
                                      CustomValidator.validateOnlyNumber(value,
                                          num: 4),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Town",
                                  style: AppTextStyles.robotoBoldBlack(12.sp)),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 190.w,
                                child: CustomTextField(
                                  controller: townController,
                                  fillColor: AppColors.grey10Color,
                                  hint: 'Montpellier',
                                  textInputAction: TextInputAction.next,
                                  hintStyle: AppTextStyles.robotoRegularGrey50
                                      .copyWith(fontSize: 14.sp),
                                  onValid: (value) =>
                                      CustomValidator.isRequired(value),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Mobile",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      PhoneNumberField(
                          inputBorderColor: AppColors.transparentColor,
                          fillColor: AppColors.grey10Color,
                          hintTextStyle: AppTextStyles.robotoRegularGrey50
                              .copyWith(fontSize: 14.sp),
                          number: number,
                          updatePhoneNumber: (phoneNumber) {
                            number = phoneNumber;
                          },
                          controller: phoneController),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Surface(m2)",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: surfaceController,
                        fillColor: AppColors.grey10Color,
                        hint: '',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) =>
                            CustomValidator.validateOnlyNumber(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Owner name",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: nameController,
                        fillColor: AppColors.grey10Color,
                        hint: 'Corinne Dubois',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Consumer<AddAddressProvider>(builder: (context, provider, _) {
                  return CustomButtonBlack(
                      buttonContent: provider.isLoading
                          ? SizedBox(
                              height: 47.h,
                              child: const CustomProgressIndicator(
                                  color: AppColors.whiteColor),
                            )
                          : const Text("Save address"),
                      onPressed: provider.isLoading
                          ? () {}
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                int addressId = await provider.addAddress(
                                    addressModel: AddressRequestModel(
                                        socId: StorageManager.getUserSocId(),
                                        addressName: addressNameController.text,
                                        address: addressController.text,
                                        zipcode: zipController.text,
                                        town: townController.text,
                                        mobileNumber: number.phoneNumber!,
                                        addressOwnerName: nameController.text,
                                        arrayOptions: ArrayOptions(
                                            surface: surfaceController.text,
                                            lat: widget.pickedLocation.geometry!
                                                .location.lat
                                                .toString(),
                                            long: widget.pickedLocation
                                                .geometry!.location.lng
                                                .toString())));
                                if (addressId > 0) {
                                  RoutingProvider.pushNamedAndRemoveAllBack(
                                      routeName: Routes.mainScreen);
                                  RoutingProvider.pushNamed(
                                      routeName: Routes.userAddressesScreen);
                                  /* RoutingProvider.pushNamedAndRemoveUntil(
                                      routeName: Routes.userAddressesScreen,
                                      stopRoute: Routes.userAddressesScreen); */
                                }
                              }
                            });
                }),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
